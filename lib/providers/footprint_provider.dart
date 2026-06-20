import 'package:flutter/foundation.dart';
import '../models/carbon_footprint.dart';

class FootprintProvider extends ChangeNotifier {
  final CarbonFootprint _footprint = CarbonFootprint();
  int _currentOnboardingPage = 0;
  bool _onboardingComplete = false;
  String _userName = '';
  String _country = 'Colombia';

  CarbonFootprint get footprint => _footprint;
  int get currentOnboardingPage => _currentOnboardingPage;
  bool get onboardingComplete => _onboardingComplete;
  String get userName => _userName;
  String get country => _country;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setCountry(String country) {
    _country = country;
    notifyListeners();
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void setOnboardingPage(int page) {
    _currentOnboardingPage = page;
    notifyListeners();
  }

  void updateTransport(TransportData data) {
    _footprint.transport = data;
    _footprint.completedModules.add('transport');
    notifyListeners();
  }

  void updateFood(FoodData data) {
    _footprint.food = data;
    _footprint.completedModules.add('food');
    notifyListeners();
  }

  void updateHome(HomeData data) {
    _footprint.home = data;
    _footprint.completedModules.add('home');
    notifyListeners();
  }

  void updateShopping(ShoppingData data) {
    _footprint.shopping = data;
    _footprint.completedModules.add('shopping');
    notifyListeners();
  }

  void updateWaste(WasteData data) {
    _footprint.waste = data;
    _footprint.completedModules.add('waste');
    notifyListeners();
  }

  void updateWater(WaterData data) {
    _footprint.water = data;
    _footprint.completedModules.add('water');
    notifyListeners();
  }

  bool isModuleComplete(String module) =>
      _footprint.completedModules.contains(module);

  int get completedCount => _footprint.completedModules.length;
  double get completionPercent => completedCount / 6;
}
