// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'FootCarbonPrint';

  @override
  String get tagline => 'Kenne deinen Fußabdruck. Ändere deine Welt.';

  @override
  String get save => 'Speichern';

  @override
  String get next => 'Weiter';

  @override
  String get skip => 'Überspringen';

  @override
  String get goToTest => 'Zum Test';

  @override
  String get startTest => 'Meinen Test starten!';

  @override
  String get startTestNow => 'Test jetzt starten! 🚀';

  @override
  String get co2PerYear => 'Tonnen CO₂/Jahr';

  @override
  String get co2Unit => 't CO₂/Jahr';

  @override
  String get moduleEstimate => 'Schätzung aus diesem Modul';

  @override
  String get saveModule => 'Modul speichern';

  @override
  String get completedCheck => 'Abgeschlossen ✓';

  @override
  String get tapToStart => 'Tippen zum Starten';

  @override
  String get onb1Title => 'Wie viel verschmutz\ndu ohne es zu wissen?';

  @override
  String get onb1Sub =>
      'Die meisten Menschen emittieren mehr CO₂ als sie denken. Entdecke in weniger als 7 Minuten deinen echten Einfluss auf den Planeten.';

  @override
  String get onb2Title => 'Dein Fußabdruck,\nin echten Daten';

  @override
  String get onb2Sub =>
      'Wir berechnen deinen jährlichen CO₂-Fußabdruck aufgeteilt nach Kategorien: Transport, Ernährung, Zuhause, Konsum, Abfall und Wasser.';

  @override
  String get onb3Title => 'Ein Aktionsplan,\nder wirklich funktioniert';

  @override
  String get onb3Sub =>
      'Wir messen nicht nur — wir sagen dir genau, was du ändern sollst und wie viel CO₂ du mit jeder Maßnahme sparst. Schritt für Schritt.';

  @override
  String get tabTest => 'Mein Test';

  @override
  String get tabFootprint => 'Mein Fußabdruck';

  @override
  String get tabPlan => 'Plan';

  @override
  String get testHubTitle => 'Dein CO₂-\nFußabdruck-Selbsttest';

  @override
  String get testHubSub =>
      'Vervollständige die Module, um deinen Einfluss zu entdecken';

  @override
  String modulesProgress(int completed, int total) {
    return '$completed von $total Modulen';
  }

  @override
  String get viewMyFootprint => 'Meinen CO₂-Fußabdruck ansehen';

  @override
  String get learnBannerFirstTitle => 'Zum ersten Mal hier?';

  @override
  String get learnBannerFirstSub =>
      'Lerne in 2 Minuten, was ein CO₂-Fußabdruck ist';

  @override
  String get learnBannerReturnTitle => 'CO₂-Fußabdruck-Leitfaden';

  @override
  String get learnBannerReturnSub =>
      'Die wichtigsten Konzepte — 6 visuelle Lektionen';

  @override
  String get modTransport => 'Transport';

  @override
  String get modTransportWeight => '28–35%';

  @override
  String get modFood => 'Ernährung';

  @override
  String get modFoodWeight => '25–30%';

  @override
  String get modHome => 'Zuhause';

  @override
  String get modHomeWeight => '20–25%';

  @override
  String get modShopping => 'Konsum';

  @override
  String get modShoppingWeight => '10–15%';

  @override
  String get modWaste => 'Abfall';

  @override
  String get modWasteWeight => '5–8%';

  @override
  String get modWater => 'Wasser';

  @override
  String get modWaterWeight => '~3%';

  @override
  String get dashEmptyTitle => 'Noch keine Ergebnisse';

  @override
  String get dashEmptySub =>
      'Schließe mindestens ein Test-Modul ab, um deinen CO₂-Fußabdruck hier zu sehen.';

  @override
  String get dashAppBarTitle => 'Dein CO₂-Fußabdruck';

  @override
  String get equivalencesTitle => 'Dein Fußabdruck entspricht...';

  @override
  String get treesLabel => 'Bäume\ngefällt/Jahr';

  @override
  String get bulbYearsLabel => 'Glühbirnen-\njahre';

  @override
  String get phoneChargesLabel => 'Smartphone-\nladungen';

  @override
  String get breakdownTitle => 'Aufschlüsselung nach Kategorie';

  @override
  String get benchmarkTitle => 'Globaler Vergleich';

  @override
  String get yourFootprint => 'Dein Fußabdruck';

  @override
  String get parisTarget => 'Paris-Ziel 2050';

  @override
  String get colombiaAvg => 'Kolumbien Durchschnitt';

  @override
  String get worldAvg => 'Weltdurchschnitt';

  @override
  String get viewActionPlan => 'Aktionsplan ansehen';

  @override
  String get ecoPoints => 'Öko-Punkte';

  @override
  String nextLevelLabel(String emoji, String name) {
    return 'Nächste: $emoji $name';
  }

  @override
  String ptsMore(int pts) {
    return '$pts Pts mehr';
  }

  @override
  String get maxLevelReached => 'Höchste Stufe erreicht! 🎉';

  @override
  String get myAchievements => 'Meine Erfolge';

  @override
  String get shareMyLevel => 'Mein Level teilen';

  @override
  String get shareSub =>
      'Lade deine Öko-Karte herunter und teile sie in sozialen Netzwerken';

  @override
  String get lvlChampion => 'Grüner Champion';

  @override
  String get lvlConscious => 'Bewusst';

  @override
  String get lvlOntrack => 'Auf dem richtigen Weg';

  @override
  String get lvlHigh => 'Hoher Einfluss';

  @override
  String get lvlCritical => 'Kritisch';

  @override
  String get ecoLvlBeginner => 'Anfänger';

  @override
  String get ecoLvlLearner => 'Lernender';

  @override
  String get ecoLvlConscious => 'Bewusst';

  @override
  String get ecoLvlActivist => 'Aktivist';

  @override
  String get ecoLvlChampion => 'Öko-Champion';

  @override
  String get badgeFirstStep => 'Erster Schritt';

  @override
  String get badgeFirstStepDesc => 'Schließe dein erstes Test-Modul ab';

  @override
  String get badgeExplorer => 'Entdecker';

  @override
  String get badgeExplorerDesc => 'Schließe 3 Test-Module ab';

  @override
  String get badgeCompletionist => 'Vollender';

  @override
  String get badgeCompletionistDesc => 'Schließe alle 6 Test-Module ab';

  @override
  String get badgeEducated => 'Gebildet';

  @override
  String get badgeEducatedDesc => 'Beende den Lernleitfaden';

  @override
  String get badgeConscious => 'Bewusst';

  @override
  String get badgeConsciousDesc => 'Erreiche einen Fußabdruck unter 3 Tonnen';

  @override
  String get badgeChampion => 'Leichter Fußabdruck';

  @override
  String get badgeChampionDesc => 'Erreiche einen Fußabdruck unter 1,5 Tonnen';

  @override
  String get badgeCommitted => 'Engagiert';

  @override
  String get badgeCommittedDesc => 'Verpflichte dich zu mindestens 1 Maßnahme';

  @override
  String get badgeActivist => 'Aktivist';

  @override
  String get badgeActivistDesc =>
      'Verpflichte dich zu 5 Maßnahmen aus dem Plan';

  @override
  String badgeLocked(String description) {
    return '🔒 $description';
  }

  @override
  String get actionPlanTitle => 'Aktionsplan';

  @override
  String get actionPlanEmptyTitle => 'Noch kein Plan';

  @override
  String get actionPlanEmptySub =>
      'Schließe mindestens ein Test-Modul ab, um deinen personalisierten Aktionsplan zu sehen.';

  @override
  String get reductionTitle => 'Wie viel kannst du reduzieren?';

  @override
  String reductionSub(int pct) {
    return 'bis zu $pct% mit den folgenden Maßnahmen';
  }

  @override
  String get actionsTitle => 'Deine Top-Maßnahmen nach Wirkung';

  @override
  String get actionsSub =>
      'Sortiert nach höchstem bis niedrigstem Einsparpotenzial';

  @override
  String get commit => 'Ich verpflichte mich';

  @override
  String get committedLabel => '✓ Verpflichtet';

  @override
  String get challengesTitle => 'Wöchentliche Herausforderungen 🎯';

  @override
  String get challengesSub => 'Kleine Veränderungen mit großer Wirkung';

  @override
  String get actionFlightTitle => '1 Langstreckenflug pro Jahr streichen';

  @override
  String get actionFlightDesc =>
      'Ein Langstreckenflug emittiert mehr CO₂ als 2 Monate Autofahren.';

  @override
  String get actionFlexitarianTitle => 'Flexitarische Ernährung einführen';

  @override
  String get actionFlexitarianDesc =>
      'Fleisch auf 2–3 Mal pro Woche reduzieren hat einen großen Einfluss.';

  @override
  String get actionPublicTransportTitle =>
      'Öffentliche Verkehrsmittel 2 Tage/Woche';

  @override
  String get actionPublicTransportDesc =>
      'Das Auto 2 Tage stehen lassen vermeidet ~350 kg CO₂ pro Jahr.';

  @override
  String get actionLessBeefTitle => '3 Tage/Woche kein Rindfleisch';

  @override
  String get actionLessBeefDesc =>
      'Rindfleisch emittiert 27 kgCO₂/kg — das höchste aller Lebensmittel.';

  @override
  String get actionLedTitle => 'Auf LED-Lampen umsteigen';

  @override
  String get actionLedDesc =>
      'LEDs verbrauchen 75% weniger Energie als Glühbirnen.';

  @override
  String get actionShortShowerTitle => 'Duschen max. 5 Minuten';

  @override
  String get actionShortShowerDesc =>
      'Die Dusche auf 5 Min mit warmem Wasser zu reduzieren spart 100 kgCO₂/Jahr.';

  @override
  String get actionRecycleTitle => 'Abfall zum Recycling trennen';

  @override
  String get actionRecycleDesc =>
      'Recycling verhindert die anaerobe Zersetzung, die Methan produziert.';

  @override
  String get actionSecondhandTitle => '50% Second-Hand-Kleidung kaufen';

  @override
  String get actionSecondhandDesc =>
      'Die Textilindustrie ist eine der umweltschädlichsten der Welt.';

  @override
  String get actionCompostTitle => 'Organische Abfälle kompostieren';

  @override
  String get actionCompostDesc =>
      'Kompostieren verhindert, dass organische Abfälle Methan auf Deponien erzeugen.';

  @override
  String get actionBikeTitle => 'Mit dem Fahrrad oder zu Fuß zur Arbeit';

  @override
  String get actionBikeDesc => 'Null Emissionen + Gesundheitsvorteile.';

  @override
  String get challengeWeekLabel => 'Herausforderung der Woche';

  @override
  String get challengeExpiresLabel => 'Läuft diesen Sonntag ab';

  @override
  String challengePts(int pts) {
    return '+$pts Pts';
  }

  @override
  String get challengeMarkDone =>
      'Ich hab\'s geschafft! Als erledigt markieren';

  @override
  String get challengeCompletedLabel =>
      'Herausforderung diese Woche abgeschlossen! 🎉';

  @override
  String get challengeCompletedSub => 'Du hast +25 Punkte verdient';

  @override
  String get challenge1 => 'Eine Woche ohne Einwegplastik';

  @override
  String get challengeDesc1 =>
      'Bring eine wiederverwendbare Tasche mit und vermeide 7 Tage lang Plastikbecher, Strohhalme und -tüten.';

  @override
  String get challengeEmoji1 => '🛍️';

  @override
  String get challenge2 => '7 Tage ohne rotes Fleisch';

  @override
  String get challengeDesc2 =>
      'Ersetze Rindfleisch für die ganze Woche durch Hühnchen, Fisch, Hülsenfrüchte oder Tofu.';

  @override
  String get challengeEmoji2 => '🥩';

  @override
  String get challenge3 => '3 Tage diese Woche Fahrrad oder zu Fuß';

  @override
  String get challengeDesc3 =>
      'Lass das Auto mindestens 3 Tage stehen und nutze Fahrrad, Roller oder deine Füße.';

  @override
  String get challengeEmoji3 => '🚲';

  @override
  String get challenge4 => '5 Tage lang max. 5 Minuten duschen';

  @override
  String get challengeDesc4 =>
      'Benutze einen Timer — max. 5 Minuten mit warmem Wasser, an 5 aufeinanderfolgenden Tagen.';

  @override
  String get challengeEmoji4 => '🚿';

  @override
  String get learnGuideTitle => 'CO₂-Fußabdruck-Leitfaden';

  @override
  String get learnNext => 'Weiter →';

  @override
  String get l1Title => 'Der Planet\nhat Fieber';

  @override
  String get l1Body =>
      'Stell dir vor, die Erde wäre dein Körper. Wenn du nur 1°C Fieber hast, fühlst du dich schon schlecht. Die Erde ist bereits 1,2°C wärmer als vor 150 Jahren… und es wird jedes Jahr wärmer.';

  @override
  String get l1FactLabel => 'FAKT';

  @override
  String get l1Fact =>
      '2023 war das wärmste Jahr seit Beginn der Aufzeichnungen. Die 10 heißesten Jahre der Geschichte lagen alle in den letzten 10 Jahren.';

  @override
  String get l1TempLow => 'Leichtes Abschmelzen von Gletschern';

  @override
  String get l1TempNow => 'Wo wir heute stehen 📍';

  @override
  String get l1TempHeat => 'Extreme Hitzewellen';

  @override
  String get l1TempCrisis => 'Zivilisation in Gefahr';

  @override
  String get l2Title => 'Das unsichtbare\nGas';

  @override
  String get l2Body =>
      'Wenn du Benzin, Gas oder Kohle verbrennst — oder wenn Lebensmittel verrotten — wird CO₂ freigesetzt. Dieses Gas wirkt wie eine Decke: Es lässt die Sonnenwärme herein, aber nicht heraus. Der Planet erwärmt sich.';

  @override
  String get l2FactLabel => 'ANALOGIE';

  @override
  String get l2Fact =>
      'Es ist, als würde man das Auto in einer geschlossenen Garage laufen lassen. Nur dass die Garage die gesamte Erdatmosphäre ist.';

  @override
  String get l2Step1 => 'Sonne sendet\nWärme';

  @override
  String get l2Step2 => 'Erde\nempfängt';

  @override
  String get l2Step3 => 'CO₂ hält\ndie Wärme';

  @override
  String get l2Result => '🌡️ Wärme kann nicht entweichen → Temperatur steigt';

  @override
  String get l3Title => 'Dein persönlicher\nFußabdruck';

  @override
  String get l3Body =>
      'Der \"CO₂-Fußabdruck\" ist das gesamte CO₂, das du in einem Jahr produzierst. Er beinhaltet alles, was du konsumierst: den Bus, den du nimmst, den Burger, den du isst, das Hemd, das du kaufst, die heiße Dusche, die du nimmst.';

  @override
  String get l3FactLabel => 'IN KOLUMBIEN';

  @override
  String get l3Fact =>
      'Ein Kolumbianer produziert durchschnittlich 1,8 Tonnen CO₂ pro Jahr. Der Weltdurchschnitt beträgt 4,7 t. Das Ziel bis 2030 ist, unter 2 t zu kommen.';

  @override
  String get l3ColombiaLabel => 'Kolumbien\nDurchschnitt';

  @override
  String get l3WorldLabel => 'Welt\nDurchschnitt';

  @override
  String get l3TargetLabel => 'Ziel\n2030 🎯';

  @override
  String get l4Title => 'Woher\nkommt es?';

  @override
  String get l4Body =>
      'Nicht nur Autos verschmutzen. Dein Fußabdruck kommt aus 6 großen Kategorien deines Alltags. Einige überraschen: Rindfleisch emittiert mehr CO₂ als ein Auto zu fahren.';

  @override
  String get l4FactLabel => 'DIE 6 KATEGORIEN';

  @override
  String get l4Fact =>
      'Transport und Ernährung zusammen machen mehr als 55% deines gesamten Fußabdrucks aus.';

  @override
  String get l5Title => 'Wie viel\nist zu viel?';

  @override
  String get l5Body =>
      'Es gibt ein globales Ziel: Um die schlimmsten Folgen des Klimawandels zu vermeiden, muss jeder Mensch bis 2030 unter 2 Tonnen CO₂ pro Jahr kommen.';

  @override
  String get l5FactLabel => 'VERGLEICH';

  @override
  String get l5Fact =>
      'Ein US-Bürger produziert 15 t/Jahr. Ein Deutscher: 9 t. Ein Kolumbianer: 1,8 t. Aber die Lebensqualität muss nicht sinken, um den Fußabdruck zu reduzieren.';

  @override
  String get l6Title => 'Du kannst\netwas ändern';

  @override
  String get l6Body =>
      'Du musst kein Aktivist sein oder dein Leben über Nacht ändern. Kleine Veränderungen bei Transport, Ernährung und Wohngewohnheiten können deinen Fußabdruck um bis zu 40% reduzieren.';

  @override
  String get l6FactLabel => 'DER ERSTE SCHRITT';

  @override
  String get l6Fact =>
      'Deinen Fußabdruck zu kennen ist der erste Schritt. Was man nicht misst, kann man nicht verbessern. Mach jetzt den Test!';

  @override
  String get l6Action1 => 'Weniger Fleisch essen';

  @override
  String get l6Action2 => 'Öffentliche Verkehrsmittel nutzen';

  @override
  String get l6Action3 => '1 Langstreckenflug vermeiden';

  @override
  String get l6Action4 => 'Auf LED umsteigen';

  @override
  String get l6ActionsLabel => 'Maßnahmen mit hoher Wirkung:';

  @override
  String get profileCardTitle => 'Meine Öko-Karte';

  @override
  String get profileCardPreview =>
      'Vorschau — teile dein Level in sozialen Netzwerken 🌍';

  @override
  String get photoDialogTitle => 'Dein Foto hinzufügen?';

  @override
  String get photoDialogContent =>
      'Du kannst die Karte mit deinem Profilbild personalisieren oder einfach das Emoji deines Levels verwenden.';

  @override
  String get emojiOnly => 'Nur Emoji';

  @override
  String get choosePhoto => 'Foto auswählen';

  @override
  String get addPhoto => 'Foto hinzufügen';

  @override
  String get changePhoto => 'Foto ändern';

  @override
  String get generating => 'Wird erstellt...';

  @override
  String get downloadPng => 'PNG herunterladen';

  @override
  String get cardDownloaded => 'Karte heruntergeladen! 🌿';

  @override
  String get downloadHint =>
      'Das Bild wird in 1080×1080 px heruntergeladen,\nideal für Instagram, WhatsApp und Twitter.';

  @override
  String get cardFooterText => 'Kenne deinen Fußabdruck. Ändere deine Welt.';

  @override
  String get statsModules => 'Module';

  @override
  String get statsAchievements => 'Erfolge';

  @override
  String get transportModuleTitle => 'Transport';

  @override
  String get transportModuleWeight => '28–35% deines Fußabdrucks';

  @override
  String get transportQ1 => 'Was ist dein wichtigstes Verkehrsmittel?';

  @override
  String get transportQ2 => 'Wie viele km legst du pro Woche zurück?';

  @override
  String transportKmHint(int km) {
    return '$km km/Woche';
  }

  @override
  String get transportQ3 => 'Wie viele Flüge unternimmst du pro Jahr?';

  @override
  String get flightShort => 'Kurz (< 3h)';

  @override
  String get flightMedium => 'Mittel (3–6h)';

  @override
  String get flightLong => 'Lang (> 6h)';

  @override
  String get vehicleGasoline => 'Benzin';

  @override
  String get vehicleDiesel => 'Diesel';

  @override
  String get vehicleHybrid => 'Hybrid';

  @override
  String get vehicleElectric => 'Elektrisch';

  @override
  String get vehicleMotorcycle => 'Motorrad';

  @override
  String get vehicleBus => 'Bus/U-Bahn';

  @override
  String get vehicleBicycle => 'Fahrrad';

  @override
  String get vehicleWalking => 'Zu Fuß';

  @override
  String get foodModuleTitle => 'Ernährung';

  @override
  String get foodModuleWeight => '25–30% deines Fußabdrucks';

  @override
  String get foodQ1 => 'Wie würdest du deine Ernährung beschreiben?';

  @override
  String get foodQ2 => 'Wie oft pro Woche isst du Rindfleisch?';

  @override
  String foodBeefHint(int n) {
    return '$n Mal';
  }

  @override
  String get foodQ3 => 'Wie viel Lebensmittel verschwendest du?';

  @override
  String get foodQ4 => 'Konsumierst du lokale und saisonale Lebensmittel?';

  @override
  String get dietVegan => 'Vegan';

  @override
  String get dietVeganSub => 'Nur Pflanzen';

  @override
  String get dietVegetarian => 'Vegetarisch';

  @override
  String get dietVegetarianSub => 'Kein Fleisch';

  @override
  String get dietFlexitarian => 'Flexitarisch';

  @override
  String get dietFlexitarianSub => 'Wenig Fleisch';

  @override
  String get dietOmnivore => 'Omnivor';

  @override
  String get dietOmnivoreSub => 'Regelmäßig Fleisch';

  @override
  String get dietCarnivore => 'Fleischreich';

  @override
  String get dietCarnivoreSub => 'Täglich Fleisch';

  @override
  String get wasteNone => 'Fast nichts';

  @override
  String get wasteSome => 'Etwas';

  @override
  String get wasteLot => 'Ziemlich viel';

  @override
  String get wasteMuch => 'Sehr viel';

  @override
  String get foodLocalTitle => 'Hauptsächlich lokal und saisonal';

  @override
  String get foodLocalSub => 'Reduziert bis zu 0,1 tCO₂/Jahr';

  @override
  String get homeModuleTitle => 'Zuhause & Energie';

  @override
  String get homeModuleWeight => '20–25% deines Fußabdrucks';

  @override
  String get homeQ1 => 'Wie viele Personen leben in deinem Haushalt?';

  @override
  String homePersonsHint(int n, String plural) {
    return '$n Person$plural';
  }

  @override
  String get homeQ2 => 'Was ist deine wichtigste Energiequelle?';

  @override
  String get homeQ3 => 'Wie viele kWh verbrauchst du pro Monat?';

  @override
  String homeKwhHint(int n) {
    return '$n kWh';
  }

  @override
  String get homeKwhAvg => 'Durchschnittlicher Haushalt: 170–250 kWh/Monat';

  @override
  String get homeQ4 => 'Hast du eine Klimaanlage oder Heizung?';

  @override
  String get homeACTitle => 'Ja, ich nutze Klimaanlage / Heizung';

  @override
  String homeACHoursHint(int n) {
    return '$n Stunden/Tag';
  }

  @override
  String get energyGrid => 'Stromnetz';

  @override
  String get energySolar => 'Solar';

  @override
  String get energyGas => 'Erdgas';

  @override
  String get energyMixed => 'Gemischt';

  @override
  String get shoppingModuleTitle => 'Konsum';

  @override
  String get shoppingModuleWeight => '10–15% deines Fußabdrucks';

  @override
  String get shoppingQ1 => 'Wie viele Kleidungsstücke kaufst du pro Monat?';

  @override
  String shoppingClothingHint(int n) {
    return '$n Stück';
  }

  @override
  String get shoppingQ2 => 'Neue elektronische Geräte pro Jahr?';

  @override
  String shoppingElectronicsHint(int n) {
    return '$n Geräte';
  }

  @override
  String get shoppingQ3 => 'Wie viele E-Commerce-Pakete erhältst du pro Monat?';

  @override
  String shoppingPackagesHint(int n) {
    return '$n Pakete';
  }

  @override
  String get shoppingQ4 => 'Kaufst du Kleidung oder Artikel aus zweiter Hand?';

  @override
  String get shoppingSecondHandTitle => 'Ja, ich kaufe häufig Second-Hand';

  @override
  String get shoppingSecondHandSub =>
      'Reduziert deinen Konsumfußabdruck um bis zu 10%';

  @override
  String get wasteModuleTitle => 'Abfall';

  @override
  String get wasteModuleWeight => '5–8% deines Fußabdrucks';

  @override
  String get wasteQ1 => 'Wie viele Müllbeutel erzeugst du pro Woche?';

  @override
  String wasteBagsHint(int n, String plural) {
    return '$n Beutel$plural';
  }

  @override
  String get wasteQ2 => 'Trennst du Abfall zum Recyceln?';

  @override
  String get wasteSeparateTitle => 'Ja, ich trenne Plastik, Papier und Glas';

  @override
  String get wasteSeparateSub => 'Reduziert deinen Abfallfußabdruck um 30%';

  @override
  String get wasteQ3 => 'Kompostierst du organische Abfälle?';

  @override
  String get wasteCompostTitle => 'Ja, ich kompostiere';

  @override
  String get wasteCompostSub => 'Reduziert Methanemissionen aus Deponien';

  @override
  String get waterModuleTitle => 'Wasser';

  @override
  String get waterModuleWeight => '~3% deines Fußabdrucks';

  @override
  String get waterQ1 =>
      'Wie viele Minuten dauert deine durchschnittliche Dusche?';

  @override
  String waterMinutesHint(int n) {
    return '$n Minuten';
  }

  @override
  String get waterQ2 => 'Bei welcher Temperatur duschst du normalerweise?';

  @override
  String get waterQ3 => 'Bewässerst du einen Garten oder Grünflächen zu Hause?';

  @override
  String get waterGardenTitle =>
      'Ja, ich habe einen Garten oder bewässere Pflanzen';

  @override
  String get tempCold => 'Kalt';

  @override
  String get tempColdSub => 'Ohne Heizung';

  @override
  String get tempWarm => 'Warm';

  @override
  String get tempWarmSub => 'Mäßige Heizung';

  @override
  String get tempHot => 'Heiß';

  @override
  String get tempHotSub => 'Volle Heizung';

  @override
  String get cancel => 'Abbrechen';

  @override
  String greetingWithName(String name) {
    return 'Hallo, $name 👋';
  }

  @override
  String get greetingEmpty => 'Hallo 👋';

  @override
  String get addYourName => 'Deinen Namen hinzufügen';

  @override
  String get nameDialogTitle => 'Wie heißt du?';

  @override
  String get nameDialogHint => 'Dein Name';

  @override
  String get nameOnCard => 'Name auf der Karte';

  @override
  String get historyTitle => 'Entwicklung deines Fußabdrucks';

  @override
  String historyMeasurements(int n) {
    return '$n Messungen';
  }

  @override
  String get historyEmptyTitle => 'Noch kein Verlauf';

  @override
  String get historyEmptySub =>
      'Aktualisiere deine Module an verschiedenen Tagen, um zu verfolgen, wie sich dein Fußabdruck entwickelt.';

  @override
  String get historyOneMeasurement => 'Erste Messung aufgezeichnet! 🎉';

  @override
  String get historyOneSub =>
      'Komm morgen wieder und aktualisiere ein Modul, um deine Entwicklung zu sehen.';

  @override
  String historyImproved(String pct) {
    return '↓ $pct% seit deiner ersten Messung';
  }

  @override
  String historyWorsened(String pct) {
    return '↑ $pct% seit deiner ersten Messung';
  }

  @override
  String get offsetTitle => 'Wie kannst du deinen Fußabdruck ausgleichen?';

  @override
  String get offsetSubtitle =>
      'Während du reduzierst, kannst du das verbleibende CO₂ neutralisieren';

  @override
  String offsetTreesValue(int n) {
    return '$n Bäume';
  }

  @override
  String get offsetTreesLabel =>
      'um deinen jährlichen Fußabdruck zu absorbieren';

  @override
  String offsetCostValue(int usd) {
    return '~$usd USD/Jahr';
  }

  @override
  String offsetCostMonthly(int usd) {
    return '~$usd USD/Monat';
  }

  @override
  String get offsetCostLabel => 'in zertifizierten CO₂-Zertifikaten';

  @override
  String get offsetReduceFirst => 'Erst reduzieren, dann ausgleichen';

  @override
  String get offsetReduceFirstDesc =>
      'CO₂-Zertifikate sind eine Ergänzung, kein Ersatz für die Reduzierung deines Fußabdrucks.';

  @override
  String get offsetPlatformsTitle => 'Zertifizierte Plattformen';

  @override
  String get offsetDisclaimer =>
      '* Schätzung basierend auf dem freiwilligen CO₂-Markt (~\$20/t CO₂) und der Absorption eines ausgewachsenen Baumes (~21 kg CO₂/Jahr).';

  @override
  String get resultsTitle => 'Diagnose abgeschlossen!';

  @override
  String get resultsSub => 'Du hast alle 6 CO₂-Fußabdruck-Module abgeschlossen';

  @override
  String get resultsYourFootprint => 'Dein jährlicher CO₂-Fußabdruck';

  @override
  String get resultsCompareTitle => 'Wie schneidest du ab?';

  @override
  String get resultsYou => 'Du';

  @override
  String get resultsParis => 'Paris-Ziel';

  @override
  String get resultsColombia => 'Kolumbien';

  @override
  String get resultsWorld => 'Welt';

  @override
  String get resultsTopSources => 'Hauptemissionsquellen';

  @override
  String get resultsAchievements => 'Deine Erfolge';

  @override
  String resultsEcoPoints(int points) {
    return '$points EcoScore-Punkte';
  }

  @override
  String get resultsBadgesUnlocked => 'Erfolge freigeschaltet';

  @override
  String get resultsViewDashboard => 'Vollständiges Dashboard ansehen';

  @override
  String get resultsViewPlan => 'Meinen Aktionsplan erstellen';

  @override
  String get resultsViewAgain => 'Meine Ergebnisse ansehen 🏆';

  @override
  String get exportResult => 'Bild exportieren';

  @override
  String get downloadImage => 'Bild herunterladen';

  @override
  String get tabHome => 'Startseite';

  @override
  String get homeWelcomeTitle => 'Kenne deinen CO₂-Fußabdruck';

  @override
  String get homeWelcomeSub =>
      'Vervollständige die 6 Diagnosemodule und entdecke, wie du deinen Einfluss auf den Planeten reduzieren kannst.';

  @override
  String get homeStartTest => 'Meine Diagnose starten';

  @override
  String get homeUpdateTest => 'Meinen Test aktualisieren';

  @override
  String get homeViewFullFootprint => 'Vollständige Analyse ansehen';

  @override
  String homeModulesStatus(int completed) {
    return '$completed von 6 Modulen abgeschlossen';
  }
}
