/// Emission factors and benchmarks used by FootCarbonPrint.
/// All sources are documented in detail in [EmissionReferences].
class EmissionFactors {
  // ── TRANSPORT ─────────────────────────────────────────────────────────────
  // kgCO2e per km per passenger (includes upstream fuel/energy production).
  // Sources: EEA (2024); DEFRA Conversion Factors 2024; Our World in Data
  //          (Ritchie, 2020 — ourworldindata.org/travel-carbon-footprint)
  static const gasoline   = 0.21;   // petrol car, average fleet
  static const diesel     = 0.24;   // diesel car, average fleet
  static const hybrid     = 0.12;   // petrol-electric hybrid
  static const electric   = 0.05;   // BEV lifecycle (incl. battery manufacturing)
  static const motorcycle = 0.11;   // DEFRA 2024
  static const bus        = 0.089;  // Ritchie (2020) Our World in Data
  static const metro      = 0.041;  // electric metro/rail; DEFRA 2024
  static const bicycle    = 0.0;
  static const walking    = 0.0;

  // ── FLIGHTS ───────────────────────────────────────────────────────────────
  // kgCO2e per passenger, economy class, one-way.
  // Source: ICAO Carbon Emissions Calculator v13 (Aug 2024) — icao.int/ICEC
  // Long-haul value applies a radiative forcing multiplier (≈ ×1.28) to account
  // for non-CO2 climate effects at cruise altitude (contrails, NOx, etc.).
  static const flightShort  = 255.0;  // < 3 h  (≈ 900 km)
  static const flightMedium = 590.0;  // 3–6 h  (≈ 2 500 km)
  static const flightLong   = 1620.0; // > 6 h  (≈ 7 000 km, incl. RF factor)

  // ── FOOD ──────────────────────────────────────────────────────────────────
  // kgCO2e per kg of product at retail weight (global median, full supply chain).
  // Source: Poore & Nemecek (2018), Science 360(6392):987-992.
  //         Data: ourworldindata.org/grapher/ghg-per-kg-poore
  static const beef       = 27.0;  // avg of beef-herd + dairy-herd beef
  static const pork       = 7.6;   // Poore & Nemecek 2018 median (prev. 12.0)
  static const chicken    = 6.9;   // broiler poultry
  static const fish       = 6.1;   // mixed wild-caught + farmed average
  static const dairy      = 3.2;   // whole milk (per kg)
  static const vegetables = 2.0;   // mixed basket incl. transport & processing
  static const vegan      = 1.5;   // plant-based mixed basket

  // ── DIET ANNUAL BASELINES ─────────────────────────────────────────────────
  // tCO2e per year from food system only (production + transport + waste).
  // Sources: Springmann et al. (2018) Nature; Scarborough et al. (2023) Nature Food;
  //          Oxford Martin Programme on the Future of Food
  static const dietCarnivore   = 2.5;
  static const dietOmnivore    = 1.9;
  static const dietFlexitarian = 1.4;
  static const dietVegetarian  = 1.0;
  static const dietVegan       = 0.7;

  // ── ENERGY ────────────────────────────────────────────────────────────────
  // Electricity grid emission factors — kgCO2e per kWh.
  // Colombia: UPME/XM, Factor de Emisión del SIN (Sistema Interconectado Nacional)
  //   XM 2020 official value: 0.164 kgCO2/kWh; UPME 2024: 0.220 kgCO2/kWh.
  //   Using weighted average 2020–2023: 0.175 kgCO2/kWh (updated from 0.126).
  //   Source: xm.com.co; docs.upme.gov.co/Normatividad/Soporte_calculo_Factor_de_Emision_2024.pdf
  // World: IEA Emission Factors 2023 — iea.org/data-and-statistics/data-product/emissions-factors-2023
  static const electricityColombia = 0.175; // updated from 0.126
  static const electricityWorld    = 0.459; // IEA 2022 global average (updated from 0.475)

  // Natural gas — kgCO2e per m³ at standard conditions (0 °C, 1 atm).
  // Derivation: IPCC 2006 Vol. 2, Table 1.4 (56.1 kgCO2/GJ) × LHV 36.4 MJ/m³ = 2.04 kgCO2/m³
  // Source: IPCC (2006) Guidelines for National GHG Inventories, Vol. 2 Energy, Ch. 1.
  static const naturalGas = 2.04; // per m³

  // LPG — kgCO2e per LITRE (not per kg).
  // Source: DEFRA Conversion Factors 2024 (1.557 kgCO2e/L); adjusted for Colombian LPG blend.
  // Note: density ≈ 0.54 kg/L → equivalent to ≈ 2.8 kgCO2/kg.
  static const lpg = 1.51; // per litre

  // Solar PV — lifecycle kgCO2e per kWh (manufacturing + installation amortised).
  // Source: IPCC SRREN (2011); NREL Life Cycle Harmonisation 2012. Range: 20–50 gCO2/kWh.
  static const solarLca = 0.02; // per kWh

  // ── WATER / SHOWER ────────────────────────────────────────────────────────
  // kgCO2e emitted per shower-minute per single occurrence.
  // Formula: annualCO2 (kgCO2) = showerMinutes × 365 days × factor
  // Basis: 7 kW instant electric shower head (ducha eléctrica — dominant in Colombia),
  //        blended with gas water heater (≈ 35 % of Colombian households).
  //   Electric warm:  0.080 kWh/min × 0.175 kgCO2/kWh = 0.014 kgCO2/min
  //   Gas warm:       0.080 kWh/min ÷ 10.55 kWh/m³ × 2.04 kgCO2/m³ = 0.015 kgCO2/min
  //   Blended + water-system overhead (pumping, treatment) → 0.030 kgCO2/min
  //   Hot setting uses ≈ 2× energy → 0.060 kgCO2/min
  // Sources: SSPD Colombia; UPME 2023; Carbon Trust shower energy data.
  // Previous values (0.20 / 0.40) over-estimated by ~7×; corrected here.
  static const showerColdFactor = 0.0;   // no thermal energy required
  static const showerWarmFactor = 0.030; // updated from 0.20
  static const showerHotFactor  = 0.060; // updated from 0.40

  // ── SHOPPING ──────────────────────────────────────────────────────────────
  // kgCO2e per item — lifecycle / cradle-to-gate.
  // Sources: Global Fashion Agenda — Pulse of the Fashion Industry (2017);
  //          Apple Environmental Progress Report 2023 (iPhone LCA ≈ 70 kg);
  //          Dell Technologies Product LCA (Latitude series ≈ 300–400 kg).
  static const clothingItem = 10.0;  // average garment (T-shirt ~7 kg, jeans ~33 kg)
  static const smartphone   = 70.0;  // matches Apple iPhone LCA (2023)
  static const laptop       = 300.0; // matches Dell Latitude LCA lower bound

  // ── WASTE ─────────────────────────────────────────────────────────────────
  // Annual kgCO2e emitted for 1 bag of waste generated per week.
  // Basis: ~10 kg mixed MSW per bag; landfill EF ≈ 0.5 kgCO2e/kg (organic fraction
  //        generating CH4, GWP100 = 28; IPCC FOD model) → ~5 kgCO2/bag.
  //        Annual: 52 weeks × 5 kgCO2/bag = 260 kgCO2/year per bag/week habit.
  // Sources: IPCC (2006) Guidelines Vol. 5 Waste, Ch. 3; US EPA WARM model (2023).
  static const wasteBagYear = 52 * 5.0; // 260 kgCO2e/year per (bag/week)

  // ── BENCHMARKS ────────────────────────────────────────────────────────────
  // tCO2e per person per year (all sectors).
  // Sources: IEA CO2 Emissions in 2023; Our World in Data; World Bank WDI 2023.
  static const globalAverage   = 4.7; // IEA 2023 global per-capita
  static const colombiaAverage = 1.9; // World Bank / OWID 2023 (updated from 1.8)
  static const parisTarget     = 2.0; // IPCC Special Report 1.5 °C (SR15, 2018)

  // ── CARBON OFFSET ─────────────────────────────────────────────────────────
  // Source: US EPA Greenhouse Gas Equivalencies Calculator (2023).
  //   One urban mature tree sequesters ≈ 60 kgCO2/year (0.060 tCO2/year).
  //   treesEquivalent formula: totalCO2 (t) × 1000 / 60 = totalCO2 × 16.7 trees/tonne.
  //   Previous constant was 21 kg/year (young tree avg); corrected to 60 kg/year
  //   to be consistent with the EPA-derived multiplier used in the formula.
  static const treeAbsorptionKgPerYear      = 60.0; // EPA urban tree (updated from 21.0)
  static const carbonCreditPriceUsdPerTonne = 20.0; // voluntary carbon market avg (2023)
}
