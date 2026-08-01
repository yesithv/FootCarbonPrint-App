import 'package:flutter_test/flutter_test.dart';
import 'package:foot_carbon_print/core/constants/emission_factors.dart';
import 'package:foot_carbon_print/models/carbon_footprint.dart';

/// Unit tests for the carbon-footprint calculation engine.
///
/// These lock in the official methodology (Activity Data × Emission Factor,
/// summed per category, converted to tonnes CO₂e/year) so the factors and
/// formulas cannot silently regress — as happened with the beef factor that
/// was defined but never applied.
void main() {
  const tol = 1e-9;

  group('Transport', () {
    test('driving = factor × weeklyKm × 52 / 1000', () {
      final t = TransportData(vehicle: 'gasoline', weeklyKm: 50);
      // 0.21 × 50 × 52 / 1000
      expect(t.annualCO2, closeTo(0.21 * 50 * 52 / 1000, tol));
    });

    test('flights are summed with their per-flight factors', () {
      final t = TransportData(
        vehicle: 'walking',
        weeklyKm: 0,
        shortFlights: 1,
        mediumFlights: 1,
        longFlights: 1,
      );
      final expected = (EmissionFactors.flightShort +
              EmissionFactors.flightMedium +
              EmissionFactors.flightLong) /
          1000;
      expect(t.annualCO2, closeTo(expected, tol));
    });

    test('unknown vehicle falls back to bus factor', () {
      final t = TransportData(vehicle: 'spaceship', weeklyKm: 10);
      expect(t.annualCO2, closeTo(EmissionFactors.bus * 10 * 52 / 1000, tol));
    });
  });

  group('Food', () {
    test('omnivore at average beef, no waste/local ≈ diet baseline', () {
      final f = FoodData(
        diet: 'omnivore',
        beefServingsPerWeek: 3, // == assumed average for omnivore
        localFood: false,
        foodWaste: 0.0,
      );
      expect(f.annualCO2, closeTo(EmissionFactors.dietOmnivore, tol));
    });

    test('beef uses the real 27 kgCO2e/kg factor on the deviation', () {
      final base = FoodData(
        diet: 'omnivore',
        beefServingsPerWeek: 3,
        foodWaste: 0.0,
      ).annualCO2;
      final more = FoodData(
        diet: 'omnivore',
        beefServingsPerWeek: 5, // +2 servings over average
        foodWaste: 0.0,
      ).annualCO2;
      // Each extra serving = portion × beef factor × 52 weeks / 1000.
      final perServing =
          EmissionFactors.beefPortionKg * EmissionFactors.beef * 52 / 1000;
      expect(more - base, closeTo(2 * perServing, tol));
      // Regression guard: the factor is materially large, not ~1/27 of it.
      expect(perServing, greaterThan(0.4));
    });

    test('local food applies a discount', () {
      final withLocal =
          FoodData(diet: 'omnivore', beefServingsPerWeek: 3, localFood: true, foodWaste: 0.0)
              .annualCO2;
      expect(withLocal, closeTo(EmissionFactors.dietOmnivore - 0.1, tol));
    });

    test('food waste is proportional to the diet baseline', () {
      final f = FoodData(diet: 'omnivore', beefServingsPerWeek: 3, foodWaste: 1.0);
      final expected = EmissionFactors.dietOmnivore +
          EmissionFactors.dietOmnivore *
              1.0 *
              EmissionFactors.foodWasteShareOfBaseline;
      expect(f.annualCO2, closeTo(expected, tol));
    });

    test('default omnivore total stays realistic (< 3 t/yr)', () {
      expect(FoodData().annualCO2, lessThan(3.0));
    });
  });

  group('Home', () {
    test('grid uses the selected country factor', () {
      final h = HomeData(
        energySource: 'grid',
        monthlyKwh: 200,
        householdMembers: 3,
        country: 'us',
      );
      final expected = (200 / 3) * 12 * EmissionFactors.gridFactorByCountry['us']! / 1000;
      expect(h.annualCO2, closeTo(expected, tol));
    });

    test('unknown country falls back to world average', () {
      final h = HomeData(energySource: 'grid', country: 'zz');
      expect(h.energyFactor, closeTo(EmissionFactors.electricityWorld, tol));
    });

    test('gas uses per-kWh natural gas factor (~0.19)', () {
      final h = HomeData(energySource: 'gas');
      expect(h.energyFactor, closeTo(EmissionFactors.naturalGasPerKwh, tol));
      expect(h.energyFactor, inInclusiveRange(0.18, 0.20));
    });

    test('solar uses lifecycle factor', () {
      final h = HomeData(energySource: 'solar');
      expect(h.energyFactor, closeTo(EmissionFactors.solarLca, tol));
    });

    test('AC adds hours × 365 × 1.5 kW × factor', () {
      final noAc = HomeData(
        energySource: 'grid',
        monthlyKwh: 200,
        householdMembers: 3,
        country: 'co',
      ).annualCO2;
      final withAc = HomeData(
        energySource: 'grid',
        monthlyKwh: 200,
        householdMembers: 3,
        country: 'co',
        hasAC: true,
        acHoursPerDay: 5,
      ).annualCO2;
      final expectedDelta =
          5 * 365 * 1.5 * EmissionFactors.gridFactorByCountry['co']! / 1000;
      expect(withAc - noAc, closeTo(expectedDelta, tol));
    });

    test('country persists through JSON round-trip', () {
      final h = HomeData(country: 'de');
      expect(HomeData.fromJson(h.toJson()).country, 'de');
    });

    test('legacy JSON without country defaults to co', () {
      final h = HomeData.fromJson({'monthlyKwh': 200});
      expect(h.country, 'co');
    });
  });

  group('Shopping / Waste / Water', () {
    test('shopping uses onlinePackageKg constant', () {
      final s = ShoppingData(
        clothingItemsPerMonth: 0,
        electronicsPerYear: 0,
        onlinePackagesPerMonth: 4,
        buysSecondHand: false,
      );
      expect(s.annualCO2,
          closeTo(4 * 12 * EmissionFactors.onlinePackageKg / 1000, tol));
    });

    test('waste discounts stack for recycling + composting', () {
      final w = WasteData(
          wasteBagsPerWeek: 2, separatesWaste: true, composts: true);
      final expected =
          2 * EmissionFactors.wasteBagYear / 1000 * 0.7 * 0.8;
      expect(w.annualCO2, closeTo(expected, tol));
    });

    test('shower = minutes × 365 × tempFactor / 1000 (+garden)', () {
      final wa = WaterData(showerMinutes: 8, showerTemp: 'warm', hasGarden: true);
      final expected =
          8 * 365 * EmissionFactors.showerWarmFactor / 1000 + 0.05;
      expect(wa.annualCO2, closeTo(expected, tol));
    });
  });

  group('Total & conformance with official factors', () {
    test('total equals sum of category getters', () {
      final fp = CarbonFootprint();
      final sum = fp.transport.annualCO2 +
          fp.food.annualCO2 +
          fp.home.annualCO2 +
          fp.shopping.annualCO2 +
          fp.waste.annualCO2 +
          fp.water.annualCO2;
      expect(fp.totalCO2, closeTo(sum, tol));
    });

    test('key factors match official published values', () {
      // Poore & Nemecek (2018): beef ≈ 27 kgCO2e/kg.
      expect(EmissionFactors.beef, 27.0);
      // IEA global average grid factor ≈ 0.459 kgCO2/kWh.
      expect(EmissionFactors.electricityWorld, inInclusiveRange(0.40, 0.50));
      // IPCC/DEFRA natural gas ≈ 0.18–0.20 kgCO2/kWh.
      expect(EmissionFactors.naturalGasPerKwh, inInclusiveRange(0.18, 0.20));
      // EPA urban tree sequestration ≈ 60 kgCO2/year.
      expect(EmissionFactors.treeAbsorptionKgPerYear, 60.0);
      // 'world' fallback in the country map is the IEA average.
      expect(EmissionFactors.gridFactorByCountry['world'],
          EmissionFactors.electricityWorld);
    });
  });
}
