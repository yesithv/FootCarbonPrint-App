import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/carbon_footprint.dart';

class FootprintProvider extends ChangeNotifier {
  CarbonFootprint _footprint = CarbonFootprint();
  bool _onboardingComplete = false;
  bool _loaded = false;
  String _userName = '';

  CarbonFootprint get footprint => _footprint;
  bool get onboardingComplete => _onboardingComplete;
  bool get loaded => _loaded;
  String get userName => _userName;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    _onboardingComplete = prefs.getBool('onboarding_complete') ?? false;
    _userName = prefs.getString('user_name') ?? '';

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

  Future<void> setUserName(String name) async {
    _userName = name.trim();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', _userName);
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

  void _recordSnapshot() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    _footprint.history
        .removeWhere((s) => _sameDay(s.date, today));
    _footprint.history.add(FootprintSnapshot(
      date: today,
      totalCO2: _footprint.totalCO2,
      breakdown: Map.from(_footprint.breakdown),
    ));
    _footprint.history.sort((a, b) => a.date.compareTo(b.date));
    if (_footprint.history.length > 52) {
      _footprint.history =
          _footprint.history.sublist(_footprint.history.length - 52);
    }
  }

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  void updateTransport(TransportData data) {
    _footprint.transport = data;
    _footprint.completedModules.add('transport');
    _recordSnapshot();
    _persist();
    notifyListeners();
  }

  void updateFood(FoodData data) {
    _footprint.food = data;
    _footprint.completedModules.add('food');
    _recordSnapshot();
    _persist();
    notifyListeners();
  }

  void updateHome(HomeData data) {
    _footprint.home = data;
    _footprint.completedModules.add('home');
    _recordSnapshot();
    _persist();
    notifyListeners();
  }

  void updateShopping(ShoppingData data) {
    _footprint.shopping = data;
    _footprint.completedModules.add('shopping');
    _recordSnapshot();
    _persist();
    notifyListeners();
  }

  void updateWaste(WasteData data) {
    _footprint.waste = data;
    _footprint.completedModules.add('waste');
    _recordSnapshot();
    _persist();
    notifyListeners();
  }

  void updateWater(WaterData data) {
    _footprint.water = data;
    _footprint.completedModules.add('water');
    _recordSnapshot();
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
