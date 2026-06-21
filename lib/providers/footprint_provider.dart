import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/carbon_footprint.dart';

class FootprintProvider extends ChangeNotifier {
  CarbonFootprint _footprint = CarbonFootprint();
  bool _onboardingComplete = false;
  bool _loaded = false;

  CarbonFootprint get footprint => _footprint;
  bool get onboardingComplete => _onboardingComplete;
  bool get loaded => _loaded;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    _onboardingComplete = prefs.getBool('onboarding_complete') ?? false;

    final data = prefs.getString('footprint');
    if (data != null) {
      try {
        _footprint = CarbonFootprint.fromJson(json.decode(data));
      } catch (_) {
        _footprint = CarbonFootprint();
      }
    }

    _loaded = true;
    notifyListeners();
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('footprint', json.encode(_footprint.toJson()));
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    SharedPreferences.getInstance()
        .then((p) => p.setBool('onboarding_complete', true));
    notifyListeners();
  }

  void updateTransport(TransportData data) {
    _footprint.transport = data;
    _footprint.completedModules.add('transport');
    _persist();
    notifyListeners();
  }

  void updateFood(FoodData data) {
    _footprint.food = data;
    _footprint.completedModules.add('food');
    _persist();
    notifyListeners();
  }

  void updateHome(HomeData data) {
    _footprint.home = data;
    _footprint.completedModules.add('home');
    _persist();
    notifyListeners();
  }

  void updateShopping(ShoppingData data) {
    _footprint.shopping = data;
    _footprint.completedModules.add('shopping');
    _persist();
    notifyListeners();
  }

  void updateWaste(WasteData data) {
    _footprint.waste = data;
    _footprint.completedModules.add('waste');
    _persist();
    notifyListeners();
  }

  void updateWater(WaterData data) {
    _footprint.water = data;
    _footprint.completedModules.add('water');
    _persist();
    notifyListeners();
  }

  void resetAll() {
    _footprint = CarbonFootprint();
    _persist();
    notifyListeners();
  }

  bool isModuleComplete(String module) =>
      _footprint.completedModules.contains(module);

  int get completedCount => _footprint.completedModules.length;
  double get completionPercent => completedCount / 6;

  // Gamification
  void toggleCommitAction(String actionId) {
    if (_footprint.committedActions.contains(actionId)) {
      _footprint.committedActions.remove(actionId);
    } else {
      _footprint.committedActions.add(actionId);
    }
    _persist();
    notifyListeners();
  }

  bool isActionCommitted(String actionId) =>
      _footprint.committedActions.contains(actionId);

  int get committedActionsCount => _footprint.committedActions.length;

  void completeLearnGuide() {
    if (_footprint.learnGuideCompleted) return;
    _footprint.learnGuideCompleted = true;
    _persist();
    notifyListeners();
  }
}
