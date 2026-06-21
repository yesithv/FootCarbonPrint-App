import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../models/gamification.dart';

extension ContextL10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension AppLocalizationsGamification on AppLocalizations {
  String localizedBadgeName(String id) {
    switch (id) {
      case 'first_step':
        return badgeFirstStep;
      case 'explorer':
        return badgeExplorer;
      case 'completionist':
        return badgeCompletionist;
      case 'educated':
        return badgeEducated;
      case 'conscious':
        return badgeConscious;
      case 'champion':
        return badgeChampion;
      case 'committed':
        return badgeCommitted;
      case 'activist':
        return badgeActivist;
      default:
        return id;
    }
  }

  String localizedBadgeDesc(String id) {
    switch (id) {
      case 'first_step':
        return badgeFirstStepDesc;
      case 'explorer':
        return badgeExplorerDesc;
      case 'completionist':
        return badgeCompletionistDesc;
      case 'educated':
        return badgeEducatedDesc;
      case 'conscious':
        return badgeConsciousDesc;
      case 'champion':
        return badgeChampionDesc;
      case 'committed':
        return badgeCommittedDesc;
      case 'activist':
        return badgeActivistDesc;
      default:
        return '';
    }
  }

  String localizedEcoLevelName(EcoLevel level) {
    switch (level.name) {
      case 'Principiante':
        return ecoLvlBeginner;
      case 'Aprendiz':
        return ecoLvlLearner;
      case 'Consciente':
        return ecoLvlConscious;
      case 'Activista':
        return ecoLvlActivist;
      case 'Eco-Campeón':
        return ecoLvlChampion;
      default:
        return level.name;
    }
  }

  String localizedFootprintLevel(String level) {
    switch (level) {
      case 'champion':
        return lvlChampion;
      case 'conscious':
        return lvlConscious;
      case 'ontrack':
        return lvlOntrack;
      case 'high':
        return lvlHigh;
      default:
        return lvlCritical;
    }
  }

  String localizedModuleName(String id) {
    switch (id) {
      case 'transport':
        return modTransport;
      case 'food':
        return modFood;
      case 'home':
        return modHome;
      case 'shopping':
        return modShopping;
      case 'waste':
        return modWaste;
      case 'water':
        return modWater;
      default:
        return id;
    }
  }

  String localizedCategoryName(String key) {
    switch (key) {
      case 'Transporte':
        return modTransport;
      case 'Alimentación':
        return modFood;
      case 'Hogar':
        return modHome;
      case 'Consumo':
        return modShopping;
      case 'Residuos':
        return modWaste;
      case 'Agua':
        return modWater;
      default:
        return key;
    }
  }
}
