import '../core/constants/emission_factors.dart';

class TransportData {
  String vehicle;
  double weeklyKm;
  int shortFlights;
  int mediumFlights;
  int longFlights;
  bool usesPublicTransport;

  TransportData({
    this.vehicle = 'bus',
    this.weeklyKm = 50,
    this.shortFlights = 0,
    this.mediumFlights = 0,
    this.longFlights = 0,
    this.usesPublicTransport = false,
  });

  double get annualCO2 {
    final factors = {
      'gasoline': EmissionFactors.gasoline,
      'diesel': EmissionFactors.diesel,
      'hybrid': EmissionFactors.hybrid,
      'electric': EmissionFactors.electric,
      'motorcycle': EmissionFactors.motorcycle,
      'bus': EmissionFactors.bus,
      'metro': EmissionFactors.metro,
      'bicycle': EmissionFactors.bicycle,
      'walking': EmissionFactors.walking,
    };
    final vehicleFactor = factors[vehicle] ?? EmissionFactors.bus;
    final driving = vehicleFactor * weeklyKm * 52;
    final flights = shortFlights * EmissionFactors.flightShort +
        mediumFlights * EmissionFactors.flightMedium +
        longFlights * EmissionFactors.flightLong;
    return (driving + flights) / 1000;
  }

  Map<String, dynamic> toJson() => {
        'vehicle': vehicle,
        'weeklyKm': weeklyKm,
        'shortFlights': shortFlights,
        'mediumFlights': mediumFlights,
        'longFlights': longFlights,
        'usesPublicTransport': usesPublicTransport,
      };

  factory TransportData.fromJson(Map<String, dynamic> j) => TransportData(
        vehicle: j['vehicle'] ?? 'bus',
        weeklyKm: (j['weeklyKm'] ?? 50).toDouble(),
        shortFlights: j['shortFlights'] ?? 0,
        mediumFlights: j['mediumFlights'] ?? 0,
        longFlights: j['longFlights'] ?? 0,
        usesPublicTransport: j['usesPublicTransport'] ?? false,
      );
}

class FoodData {
  String diet;
  int beefServingsPerWeek;
  bool localFood;
  double foodWaste;

  FoodData({
    this.diet = 'omnivore',
    this.beefServingsPerWeek = 3,
    this.localFood = false,
    this.foodWaste = 0.2,
  });

  double get annualCO2 {
    final baselines = {
      'carnivore': EmissionFactors.dietCarnivore,
      'omnivore': EmissionFactors.dietOmnivore,
      'flexitarian': EmissionFactors.dietFlexitarian,
      'vegetarian': EmissionFactors.dietVegetarian,
      'vegan': EmissionFactors.dietVegan,
    };
    double base = baselines[diet] ?? EmissionFactors.dietOmnivore;
    final beefExtra = beefServingsPerWeek * 0.35 * 52 / 1000;
    final localDiscount = localFood ? -0.1 : 0.0;
    final wasteExtra = foodWaste * 0.3;
    return base + beefExtra + localDiscount + wasteExtra;
  }

  Map<String, dynamic> toJson() => {
        'diet': diet,
        'beefServingsPerWeek': beefServingsPerWeek,
        'localFood': localFood,
        'foodWaste': foodWaste,
      };

  factory FoodData.fromJson(Map<String, dynamic> j) => FoodData(
        diet: j['diet'] ?? 'omnivore',
        beefServingsPerWeek: j['beefServingsPerWeek'] ?? 3,
        localFood: j['localFood'] ?? false,
        foodWaste: (j['foodWaste'] ?? 0.2).toDouble(),
      );
}

class HomeData {
  String energySource;
  double monthlyKwh;
  int householdMembers;
  bool hasAC;
  double acHoursPerDay;

  HomeData({
    this.energySource = 'grid',
    this.monthlyKwh = 200,
    this.householdMembers = 3,
    this.hasAC = false,
    this.acHoursPerDay = 0,
  });

  double get annualCO2 {
    double factor = EmissionFactors.electricityColombia;
    if (energySource == 'solar') factor = 0.02;
    if (energySource == 'gas') factor = EmissionFactors.naturalGas / 10;

    final perPersonKwh = monthlyKwh / householdMembers;
    double base = (perPersonKwh * 12 * factor) / 1000;

    if (hasAC) {
      base += acHoursPerDay * 365 * 1.5 * factor / 1000;
    }
    return base;
  }

  Map<String, dynamic> toJson() => {
        'energySource': energySource,
        'monthlyKwh': monthlyKwh,
        'householdMembers': householdMembers,
        'hasAC': hasAC,
        'acHoursPerDay': acHoursPerDay,
      };

  factory HomeData.fromJson(Map<String, dynamic> j) => HomeData(
        energySource: j['energySource'] ?? 'grid',
        monthlyKwh: (j['monthlyKwh'] ?? 200).toDouble(),
        householdMembers: j['householdMembers'] ?? 3,
        hasAC: j['hasAC'] ?? false,
        acHoursPerDay: (j['acHoursPerDay'] ?? 0).toDouble(),
      );
}

class ShoppingData {
  int clothingItemsPerMonth;
  int electronicsPerYear;
  int onlinePackagesPerMonth;
  bool buysSecondHand;

  ShoppingData({
    this.clothingItemsPerMonth = 2,
    this.electronicsPerYear = 1,
    this.onlinePackagesPerMonth = 4,
    this.buysSecondHand = false,
  });

  double get annualCO2 {
    final clothing =
        clothingItemsPerMonth * 12 * EmissionFactors.clothingItem / 1000;
    final electronics =
        electronicsPerYear * EmissionFactors.smartphone / 1000;
    final packages = onlinePackagesPerMonth * 12 * 0.5 / 1000;
    final secondHandDiscount = buysSecondHand ? -0.1 : 0.0;
    return clothing + electronics + packages + secondHandDiscount;
  }

  Map<String, dynamic> toJson() => {
        'clothingItemsPerMonth': clothingItemsPerMonth,
        'electronicsPerYear': electronicsPerYear,
        'onlinePackagesPerMonth': onlinePackagesPerMonth,
        'buysSecondHand': buysSecondHand,
      };

  factory ShoppingData.fromJson(Map<String, dynamic> j) => ShoppingData(
        clothingItemsPerMonth: j['clothingItemsPerMonth'] ?? 2,
        electronicsPerYear: j['electronicsPerYear'] ?? 1,
        onlinePackagesPerMonth: j['onlinePackagesPerMonth'] ?? 4,
        buysSecondHand: j['buysSecondHand'] ?? false,
      );
}

class WasteData {
  bool separatesWaste;
  bool composts;
  int wasteBagsPerWeek;

  WasteData({
    this.separatesWaste = false,
    this.composts = false,
    this.wasteBagsPerWeek = 2,
  });

  double get annualCO2 {
    double base = wasteBagsPerWeek * EmissionFactors.wasteBagYear / 1000;
    if (separatesWaste) base *= 0.7;
    if (composts) base *= 0.8;
    return base;
  }

  Map<String, dynamic> toJson() => {
        'separatesWaste': separatesWaste,
        'composts': composts,
        'wasteBagsPerWeek': wasteBagsPerWeek,
      };

  factory WasteData.fromJson(Map<String, dynamic> j) => WasteData(
        separatesWaste: j['separatesWaste'] ?? false,
        composts: j['composts'] ?? false,
        wasteBagsPerWeek: j['wasteBagsPerWeek'] ?? 2,
      );
}

class WaterData {
  double showerMinutes;
  String showerTemp;
  bool hasGarden;

  WaterData({
    this.showerMinutes = 8,
    this.showerTemp = 'warm',
    this.hasGarden = false,
  });

  double get annualCO2 {
    final factors = {'cold': 0.0, 'warm': 0.2, 'hot': 0.4};
    final factor = factors[showerTemp] ?? 0.2;
    final shower = showerMinutes * 365 * factor / 1000;
    final garden = hasGarden ? 0.05 : 0.0;
    return shower + garden;
  }

  Map<String, dynamic> toJson() => {
        'showerMinutes': showerMinutes,
        'showerTemp': showerTemp,
        'hasGarden': hasGarden,
      };

  factory WaterData.fromJson(Map<String, dynamic> j) => WaterData(
        showerMinutes: (j['showerMinutes'] ?? 8).toDouble(),
        showerTemp: j['showerTemp'] ?? 'warm',
        hasGarden: j['hasGarden'] ?? false,
      );
}

class CarbonFootprint {
  TransportData transport;
  FoodData food;
  HomeData home;
  ShoppingData shopping;
  WasteData waste;
  WaterData water;
  Set<String> completedModules;

  CarbonFootprint()
      : transport = TransportData(),
        food = FoodData(),
        home = HomeData(),
        shopping = ShoppingData(),
        waste = WasteData(),
        water = WaterData(),
        completedModules = {};

  double get totalCO2 =>
      transport.annualCO2 +
      food.annualCO2 +
      home.annualCO2 +
      shopping.annualCO2 +
      waste.annualCO2 +
      water.annualCO2;

  Map<String, double> get breakdown => {
        'Transporte': transport.annualCO2,
        'Alimentación': food.annualCO2,
        'Hogar': home.annualCO2,
        'Consumo': shopping.annualCO2,
        'Residuos': waste.annualCO2,
        'Agua': water.annualCO2,
      };

  String get level {
    final t = totalCO2;
    if (t < 1.5) return 'champion';
    if (t < 3.0) return 'conscious';
    if (t < 5.0) return 'ontrack';
    if (t < 8.0) return 'high';
    return 'critical';
  }

  String get levelLabel {
    switch (level) {
      case 'champion': return 'Campeón Verde';
      case 'conscious': return 'Consciente';
      case 'ontrack': return 'En Camino';
      case 'high': return 'Alto Impacto';
      default: return 'Crítico';
    }
  }

  String get levelEmoji {
    switch (level) {
      case 'champion': return '🌿';
      case 'conscious': return '🌍';
      case 'ontrack': return '🟡';
      case 'high': return '🔴';
      default: return '💀';
    }
  }

  int get treesEquivalent => (totalCO2 * 16.7).round();
  int get lightBulbYears => (totalCO2 * 3.6).round();

  double get progressVsGlobal =>
      ((EmissionFactors.globalAverage - totalCO2) /
          EmissionFactors.globalAverage *
          100);

  bool get isBelowParisTarget => totalCO2 <= EmissionFactors.parisTarget;

  Map<String, dynamic> toJson() => {
        'transport': transport.toJson(),
        'food': food.toJson(),
        'home': home.toJson(),
        'shopping': shopping.toJson(),
        'waste': waste.toJson(),
        'water': water.toJson(),
        'completedModules': completedModules.toList(),
      };

  factory CarbonFootprint.fromJson(Map<String, dynamic> j) {
    final fp = CarbonFootprint();
    if (j['transport'] != null) {
      fp.transport = TransportData.fromJson(j['transport']);
    }
    if (j['food'] != null) fp.food = FoodData.fromJson(j['food']);
    if (j['home'] != null) fp.home = HomeData.fromJson(j['home']);
    if (j['shopping'] != null) {
      fp.shopping = ShoppingData.fromJson(j['shopping']);
    }
    if (j['waste'] != null) fp.waste = WasteData.fromJson(j['waste']);
    if (j['water'] != null) fp.water = WaterData.fromJson(j['water']);
    if (j['completedModules'] != null) {
      fp.completedModules =
          Set<String>.from(j['completedModules'] as List);
    }
    return fp;
  }
}
