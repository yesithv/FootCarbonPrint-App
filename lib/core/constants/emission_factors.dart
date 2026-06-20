class EmissionFactors {
  // Transport (kgCO2 per km)
  static const gasoline = 0.21;
  static const diesel = 0.24;
  static const hybrid = 0.12;
  static const electric = 0.05;
  static const motorcycle = 0.11;
  static const bus = 0.089;
  static const metro = 0.041;
  static const bicycle = 0.0;
  static const walking = 0.0;

  // Flights (kgCO2 per flight)
  static const flightShort = 255.0; // < 3h
  static const flightMedium = 590.0; // 3–6h
  static const flightLong = 1620.0; // > 6h

  // Food (kgCO2 per kg of food)
  static const beef = 27.0;
  static const pork = 12.0;
  static const chicken = 6.9;
  static const fish = 6.1;
  static const dairy = 3.2;
  static const vegetables = 2.0;
  static const vegan = 1.5;

  // Diet annual baselines (tCO2/year)
  static const dietCarnivore = 2.5;
  static const dietOmnivore = 1.9;
  static const dietFlexitarian = 1.4;
  static const dietVegetarian = 1.0;
  static const dietVegan = 0.7;

  // Energy (kgCO2 per kWh) — Colombia grid
  static const electricityColombia = 0.126;
  static const electricityWorld = 0.475;
  static const naturalGas = 2.04; // per m3
  static const lpg = 1.51; // per kg

  // Shopping (kgCO2 per item)
  static const clothingItem = 10.0;
  static const smartphone = 70.0;
  static const laptop = 300.0;

  // Waste (kgCO2 per bag of waste/week/year)
  static const wasteBagYear = 52 * 5.0;

  // Water (kgCO2 per minute hot shower/year)
  static const hotShowerMinuteYear = 0.4;

  // Benchmarks (tCO2/year)
  static const globalAverage = 4.7;
  static const colombiaAverage = 1.8;
  static const parisTarget = 2.0;
}
