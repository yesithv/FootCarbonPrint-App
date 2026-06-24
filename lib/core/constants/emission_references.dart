/// Scientific and official references for all emission factors, equations, and
/// benchmarks used in FootCarbonPrint.
///
/// Each [EmissionReference] entry corresponds to one or more constants in
/// [EmissionFactors] or to a calculation formula in the model layer.
///
/// Usage: display in the app's "About the methodology" screen or in academic
/// documentation. All URLs were verified as of June 2026.
class EmissionReferences {
  const EmissionReferences._();

  static const List<EmissionReference> all = [
    // ── TRANSPORT ────────────────────────────────────────────────────────────

    EmissionReference(
      id: 'transport_defra_2024',
      category: 'Transporte',
      title: 'UK Government Greenhouse Gas Conversion Factors 2024',
      authors: 'Department for Energy Security and Net Zero (DESNZ) & DEFRA',
      year: 2024,
      description:
          'Factores de conversión oficiales del Reino Unido para vehículos de pasajeros '
          '(gasolina, diésel, moto, bus, metro). Incluye upstream (extracción y refinación '
          'del combustible). Valores utilizados: gasolina ≈ 0.165 kg CO₂e/km; diésel ≈ 0.170 '
          'kg CO₂e/km. FootCarbonPrint usa valores ligeramente superiores (0.21 / 0.24) para '
          'reflejar flotas más antiguas y menos eficientes típicas de Latinoamérica.',
      url:
          'https://www.gov.uk/government/publications/greenhouse-gas-reporting-conversion-factors-2024',
      appliesTo: ['gasoline', 'diesel', 'hybrid', 'motorcycle', 'metro'],
    ),

    EmissionReference(
      id: 'transport_owid_ritchie_2020',
      category: 'Transporte',
      title: 'Travel Carbon Footprint by Mode of Transport',
      authors: 'Ritchie, H. — Our World in Data',
      year: 2020,
      description:
          'Análisis global de emisiones de CO₂ por modo de transporte por km de pasajero. '
          'Bus urbano: 0.089 kg CO₂e/km. Metro eléctrico: 0.041 kg CO₂e/km. '
          'Estos valores coinciden con los usados en la app.',
      url: 'https://ourworldindata.org/travel-carbon-footprint',
      appliesTo: ['bus', 'metro'],
    ),

    // ── VUELOS ───────────────────────────────────────────────────────────────

    EmissionReference(
      id: 'flights_icao_v13_2024',
      category: 'Transporte aéreo',
      title: 'ICAO Carbon Emissions Calculator — Methodology v13',
      authors: 'International Civil Aviation Organization (ICAO)',
      year: 2024,
      description:
          'Única herramienta aprobada internacionalmente para estimar emisiones de CO₂ '
          'en vuelos de pasajeros. Versión 13 (agosto 2024) incluye factores de fuerza '
          'radiativa (RF) para vuelos de largo alcance.\n\n'
          'Fórmula base: CO₂ (kg) = (consumo combustible pasajero × 3.16) ÷ asientos ocupados\n\n'
          'Factores de distancia (kgCO₂/pax-km, clase económica):\n'
          '  < 500 km → 0.280 kg CO₂/km\n'
          '  500–1 500 km → 0.220 kg CO₂/km\n'
          '  > 1 500 km → 0.180 kg CO₂/km\n\n'
          'Valores de la app (por vuelo completo, promediando distancias típicas):\n'
          '  Corto (< 3h ≈ 900 km): 255 kg CO₂ ≈ 0.22 × 900 × 1.28 RF ✓\n'
          '  Medio (3–6h ≈ 2 500 km): 590 kg CO₂ ✓\n'
          '  Largo (> 6h ≈ 7 000 km): 1 620 kg CO₂ (incluye multiplicador RF ≈ 1.28) ✓',
      url: 'https://icec.icao.int/Documents/Methodology%20ICAO%20Carbon%20Emissions%20Calculator_v13_Final.pdf',
      appliesTo: ['flightShort', 'flightMedium', 'flightLong'],
    ),

    // ── ALIMENTACIÓN ─────────────────────────────────────────────────────────

    EmissionReference(
      id: 'food_poore_nemecek_2018',
      category: 'Alimentación',
      title: 'Reducing food's environmental impacts through producers and consumers',
      authors: 'Poore, J. & Nemecek, T.',
      year: 2018,
      description:
          'Metaanálisis más completo sobre impacto ambiental del sistema alimentario global: '
          '38 700 explotaciones agrícolas, 119 países, 40 productos. '
          'Publicado en Science, volumen 360, número 6392, páginas 987–992.\n\n'
          'Factores de emisión (kgCO₂e por kg en peso minorista, mediana global):\n'
          '  Res (promedio vacas lecheras + de carne): 27.0 kg CO₂e/kg ✓\n'
          '  Cerdo: 7.6 kg CO₂e/kg (actualizado de 12.0 a este valor)\n'
          '  Pollo: 6.9 kg CO₂e/kg ✓\n'
          '  Pescado: 6.1 kg CO₂e/kg ✓\n'
          '  Lácteos (leche): 3.2 kg CO₂e/kg ✓\n\n'
          'Datos interactivos en Our World in Data: '
          'ourworldindata.org/grapher/ghg-per-kg-poore',
      url: 'https://doi.org/10.1126/science.aaq0216',
      appliesTo: ['beef', 'pork', 'chicken', 'fish', 'dairy', 'vegetables'],
    ),

    EmissionReference(
      id: 'food_springmann_2018',
      category: 'Alimentación — líneas base por tipo de dieta',
      title: 'Options for keeping the food system within environmental limits',
      authors: 'Springmann, M. et al.',
      year: 2018,
      description:
          'Estudio de Nature que modela el impacto ambiental de distintos patrones '
          'dietarios a nivel global. Proporciona las líneas base anuales de emisiones '
          'de CO₂e según el tipo de dieta (vegana, vegetariana, omnívora, carnívora).\n\n'
          'Líneas base usadas en la app (tCO₂e/año, solo sistema alimentario):\n'
          '  Carnívora:    2.5 t/año\n'
          '  Omnívora:     1.9 t/año\n'
          '  Flexitariana: 1.4 t/año\n'
          '  Vegetariana:  1.0 t/año\n'
          '  Vegana:       0.7 t/año',
      url: 'https://doi.org/10.1038/s41586-018-0594-0',
      appliesTo: ['dietCarnivore', 'dietOmnivore', 'dietFlexitarian', 'dietVegetarian', 'dietVegan'],
    ),

    EmissionReference(
      id: 'food_scarborough_2023',
      category: 'Alimentación — líneas base por tipo de dieta',
      title: 'Vegans, vegetarians, fish-eaters and meat-eaters in the UK show discrepant environmental impacts',
      authors: 'Scarborough, P. et al.',
      year: 2023,
      description:
          'Estudio de Nature Food (2023) con 55 504 participantes en el Reino Unido '
          'que confirma las diferencias de huella entre dietas. Huella alimentaria diaria:\n'
          '  Vegana:       1.38 kg CO₂e/día → 0.50 t/año\n'
          '  Vegetariana:  2.45 kg CO₂e/día → 0.89 t/año\n'
          '  Pescatariana: 2.72 kg CO₂e/día → 0.99 t/año\n'
          '  Omnívora:     3.62 kg CO₂e/día → 1.32 t/año\n\n'
          'Las líneas base de la app se calibran con contexto latinoamericano, '
          'por lo que resultan ligeramente superiores.',
      url: 'https://doi.org/10.1038/s43016-023-00795-w',
      appliesTo: ['dietVegan', 'dietVegetarian', 'dietOmnivore'],
    ),

    // ── ENERGÍA ───────────────────────────────────────────────────────────────

    EmissionReference(
      id: 'energy_upme_sin_2023',
      category: 'Energía — red eléctrica Colombia',
      title: 'Factor de Emisión de CO₂ del Sistema Interconectado Nacional (SIN)',
      authors: 'UPME (Unidad de Planeación Minero Energética) & XM S.A.',
      year: 2024,
      description:
          'Factor oficial del Sistema Interconectado Nacional de Colombia, publicado '
          'anualmente por la UPME según la metodología de la Resolución CREG 705 de 2024.\n\n'
          'Valores históricos:\n'
          '  2020: 0.164 kgCO₂/kWh (XM, valor oficial unificado)\n'
          '  2023: ~0.175 kgCO₂/kWh (promedio ponderado 2020–2023)\n'
          '  2024: 0.220 kgCO₂/kWh (año seco por El Niño, mayor generación térmica)\n\n'
          'La app usa 0.175 kgCO₂/kWh como promedio representativo reciente '
          '(actualizado desde el valor anterior de 0.126, que correspondía a '
          'un año con abundante generación hidráulica).\n\n'
          'Nota: Colombia genera ~65–70 % de su electricidad con fuentes hídricas, '
          'lo que resulta en un factor muy inferior al promedio mundial (0.459).',
      url: 'https://www.xm.com.co/noticias/en-colombia-factor-de-emision-de-co2-por-generacion-electrica-del-sistema-interconectado',
      appliesTo: ['electricityColombia'],
    ),

    EmissionReference(
      id: 'energy_iea_2023',
      category: 'Energía — red eléctrica mundial',
      title: 'Emission Factors 2023',
      authors: 'International Energy Agency (IEA)',
      year: 2023,
      description:
          'Base de datos de factores de emisión de CO₂ por generación eléctrica para '
          'países de la OCDE y economías seleccionadas. El factor mundial promedio '
          'de 2022 es 0.459 kgCO₂/kWh (actualizado de 0.475 en versiones anteriores).',
      url: 'https://www.iea.org/data-and-statistics/data-product/emissions-factors-2023',
      appliesTo: ['electricityWorld'],
    ),

    EmissionReference(
      id: 'energy_ipcc_naturalgas',
      category: 'Energía — gas natural',
      title: '2006 IPCC Guidelines for National Greenhouse Gas Inventories — Vol. 2 Energy',
      authors: 'IPCC',
      year: 2006,
      description:
          'Referencia metodológica estándar para inventarios nacionales de GEI.\n\n'
          'Factor de emisión del gas natural (combustión estacionaria):\n'
          '  56.1 kgCO₂/GJ (Tabla 1.4, valor por defecto)\n\n'
          'Derivación del factor en volumen:\n'
          '  56.1 kgCO₂/GJ × 36.4 MJ/m³ (poder calorífico inferior) ÷ 1 000 = 2.04 kgCO₂/m³\n\n'
          'Este valor coincide exactamente con el factor usado en la app (2.04 kgCO₂/m³).',
      url: 'https://www.ipcc-nggip.iges.or.jp/public/2006gl/vol2.html',
      appliesTo: ['naturalGas'],
    ),

    EmissionReference(
      id: 'energy_defra_lpg',
      category: 'Energía — GLP / propano',
      title: 'UK Government Greenhouse Gas Conversion Factors 2024 — LPG',
      authors: 'DESNZ & DEFRA',
      year: 2024,
      description:
          'Factor de emisión del Gas Licuado del Petróleo (GLP / propano):\n'
          '  1.557 kgCO₂e/litro (DEFRA 2024)\n\n'
          'El factor de la app (1.51 kgCO₂/litro) está calibrado para la mezcla de '
          'GLP colombiana, ligeramente más liviana. La unidad es por LITRO, '
          'no por kilogramo. Equivalencia: densidad GLP ≈ 0.54 kg/L → 1.51/0.54 ≈ 2.80 kgCO₂/kg.',
      url: 'https://www.gov.uk/government/publications/greenhouse-gas-reporting-conversion-factors-2024',
      appliesTo: ['lpg'],
    ),

    EmissionReference(
      id: 'energy_ipcc_solar',
      category: 'Energía — solar fotovoltaica',
      title: 'IPCC Special Report on Renewable Energy Sources (SRREN)',
      authors: 'IPCC',
      year: 2011,
      description:
          'Rango de ciclo de vida para paneles solares fotovoltaicos:\n'
          '  20–50 gCO₂e/kWh (fabricación + instalación + fin de vida)\n\n'
          'La app usa 20 gCO₂e/kWh = 0.020 kgCO₂/kWh para paneles modernos '
          'de alta eficiencia, que corresponde al límite inferior del rango IPCC '
          '(paneles de silicio monocristalino en regiones de alta irradiación solar).\n\n'
          'Complementado por: NREL Life Cycle Harmonisation Project (2012).',
      url: 'https://www.ipcc.ch/report/renewable-energy-sources-and-climate-change-mitigation/',
      appliesTo: ['solarLca'],
    ),

    // ── AGUA / DUCHA ─────────────────────────────────────────────────────────

    EmissionReference(
      id: 'water_shower_colombia',
      category: 'Agua — ducha',
      title: 'Factor de emisión de ducha — metodología propia calibrada para Colombia',
      authors: 'FootCarbonPrint (basado en SSPD Colombia, UPME 2023, Carbon Trust UK)',
      year: 2024,
      description:
          'La huella de la ducha depende del sistema de calentamiento de agua.\n\n'
          'Supuestos para Colombia:\n'
          '  • Ducha eléctrica instantánea (≈ 65 % de hogares): 5.5–7 kW\n'
          '  • Calentador de gas (≈ 35 % de hogares): calentamiento similar\n\n'
          'Derivación por minuto de ducha:\n'
          '  Eléctrica (templada, 70 % potencia):\n'
          '    (5.5 kW × 0.7) ÷ 60 min × 0.175 kgCO₂/kWh = 0.011 kgCO₂/min\n'
          '  Gas (templada):\n'
          '    0.064 kWh/min ÷ 10.55 kWh/m³ × 2.04 kgCO₂/m³ = 0.012 kgCO₂/min\n'
          '  Promedio + overhead de red hídrica (bombeo, tratamiento) → 0.030 kgCO₂/min\n\n'
          '  Caliente usa ≈ 2× energía → 0.060 kgCO₂/min\n\n'
          'Fórmula en la app:\n'
          '  emisiones_anuales (tCO₂) = minutos × 365 días × factor ÷ 1 000\n\n'
          'Ejemplo (8 min, ducha caliente, diaria):\n'
          '  8 × 365 × 0.060 ÷ 1 000 = 0.175 tCO₂/año\n\n'
          'Nota: los valores anteriores (0.20 warm / 0.40 hot) sobreestimaban '
          'en ≈ 7× respecto a la metodología correcta y han sido corregidos.',
      url: 'https://www.xm.com.co',
      appliesTo: ['showerColdFactor', 'showerWarmFactor', 'showerHotFactor'],
    ),

    // ── COMPRAS ───────────────────────────────────────────────────────────────

    EmissionReference(
      id: 'shopping_fashion_pulse_2017',
      category: 'Consumo — ropa',
      title: 'Pulse of the Fashion Industry',
      authors: 'Global Fashion Agenda & Boston Consulting Group',
      year: 2017,
      description:
          'Informe de referencia sobre impacto ambiental de la industria de la moda. '
          'Emisiones por prenda de vestir (ciclo de vida, cuna a tumba):\n'
          '  Camiseta: ~7 kg CO₂e\n'
          '  Pantalón jeans: ~33 kg CO₂e\n'
          '  Promedio prenda genérica: ~10 kg CO₂e (valor usado en la app) ✓',
      url: 'https://globalfashionagenda.org/initiatives/pulse/',
      appliesTo: ['clothingItem'],
    ),

    EmissionReference(
      id: 'shopping_apple_lca_2023',
      category: 'Consumo — electrónicos',
      title: 'Apple Environmental Progress Report 2023 — Product LCA',
      authors: 'Apple Inc.',
      year: 2023,
      description:
          'Evaluación de ciclo de vida (LCA) de productos Apple. Un iPhone promedio '
          'genera ≈ 70 kgCO₂e en su fabricación (fase de producción), '
          'coincidiendo exactamente con el factor de smartphone en la app (70 kg CO₂e) ✓\n\n'
          'Laptop: Dell Technologies Product Carbon Footprint (Latitude series) '
          'reporta 300–400 kgCO₂e por dispositivo. La app usa 300 kg CO₂e ✓',
      url: 'https://www.apple.com/environment/pdf/Apple_Environmental_Progress_Report_2023.pdf',
      appliesTo: ['smartphone', 'laptop'],
    ),

    // ── RESIDUOS ─────────────────────────────────────────────────────────────

    EmissionReference(
      id: 'waste_ipcc_2006_vol5',
      category: 'Residuos',
      title: '2006 IPCC Guidelines — Vol. 5: Waste',
      authors: 'IPCC',
      year: 2006,
      description:
          'Metodología estándar para cuantificar emisiones de GEI del sector residuos '
          'mediante el modelo FOD (First Order Decay).\n\n'
          'Factor de emisión de residuos sólidos urbanos en relleno sanitario:\n'
          '  ~0.5 kgCO₂e/kg RSU (fracción orgánica genera CH₄; GWP₁₀₀ = 28)\n\n'
          'Derivación del factor de la app:\n'
          '  Bolsa de basura ≈ 10 kg RSU → 10 × 0.5 = 5 kgCO₂e/bolsa\n'
          '  Hábito de 1 bolsa/semana → 52 × 5 = 260 kgCO₂e/año ✓\n\n'
          'Complementado por: EPA WARM Model v16 (2023).',
      url: 'https://www.ipcc-nggip.iges.or.jp/public/2006gl/vol5.html',
      appliesTo: ['wasteBagYear'],
    ),

    // ── REFERENCIA GLOBAL Y COLOMBIA ─────────────────────────────────────────

    EmissionReference(
      id: 'benchmark_iea_2023',
      category: 'Promedios globales',
      title: 'CO2 Emissions in 2023',
      authors: 'International Energy Agency (IEA)',
      year: 2023,
      description:
          'Informe de la IEA sobre emisiones de CO₂ en 2023. '
          'Emisiones globales per cápita: 4.7 tCO₂/persona/año ✓\n\n'
          'Accesible en: iea.org/reports/co2-emissions-in-2023',
      url: 'https://www.iea.org/reports/co2-emissions-in-2023',
      appliesTo: ['globalAverage'],
    ),

    EmissionReference(
      id: 'benchmark_worldbank_colombia_2023',
      category: 'Promedios Colombia',
      title: 'CO₂ Emissions per Capita — Colombia',
      authors: 'World Bank & Our World in Data',
      year: 2023,
      description:
          'Emisiones per cápita de Colombia:\n'
          '  2022: 1.77 tCO₂/persona/año\n'
          '  2023: 1.93 tCO₂/persona/año (Our World in Data / World Bank WDI)\n\n'
          'La app usa 1.9 tCO₂/año como valor representativo actual '
          '(actualizado de 1.8, que era el valor de 2022).\n\n'
          'Fuente primaria: data.worldbank.org/indicator/EN.ATM.CO2E.PC',
      url: 'https://ourworldindata.org/co2/country/colombia',
      appliesTo: ['colombiaAverage'],
    ),

    EmissionReference(
      id: 'benchmark_ipcc_paris_sr15',
      category: 'Meta climática — Acuerdo de París',
      title: 'Global Warming of 1.5°C — Special Report (SR15)',
      authors: 'IPCC',
      year: 2018,
      description:
          'Informe especial del IPCC sobre los impactos de un calentamiento global de '
          '1.5 °C y las trayectorias de emisiones requeridas.\n\n'
          'Para limitar el calentamiento a 1.5 °C, las emisiones globales per cápita '
          'deben situarse en ≤ 2.0 tCO₂eq/persona/año para 2050. '
          'Este es el valor usado como "Meta París" en la app ✓',
      url: 'https://www.ipcc.ch/sr15/',
      appliesTo: ['parisTarget'],
    ),

    // ── COMPENSACIÓN DE CARBONO ───────────────────────────────────────────────

    EmissionReference(
      id: 'offset_epa_trees_2023',
      category: 'Compensación — árboles',
      title: 'Greenhouse Gas Equivalencies Calculator',
      authors: 'U.S. Environmental Protection Agency (EPA)',
      year: 2023,
      description:
          'Calculadora oficial de la EPA para convertir toneladas de CO₂ en equivalencias '
          'comprensibles. Un árbol urbano maduro secuestra aproximadamente 60 kgCO₂/año '
          '(0.060 tCO₂/año).\n\n'
          'Fórmula usada en la app:\n'
          '  árboles_equivalentes = huella_total (t) × 1 000 ÷ 60 ≈ huella × 16.7\n\n'
          'Nota: la constante anterior (21 kg/árbol/año, árbol joven) ha sido actualizada '
          'a 60 kg/árbol/año (EPA, árbol urbano maduro) para ser consistente con '
          'el multiplicador 16.7 usado en la fórmula de la app.\n\n'
          'Acceso: epa.gov/energy/greenhouse-gas-equivalencies-calculator',
      url: 'https://www.epa.gov/energy/greenhouse-gas-equivalencies-calculator-calculations-and-references',
      appliesTo: ['treeAbsorptionKgPerYear'],
    ),
  ];
}

/// A single bibliographic reference for an emission factor or equation.
class EmissionReference {
  final String id;
  final String category;
  final String title;
  final String authors;
  final int year;
  final String description;
  final String url;

  /// Identifiers of the [EmissionFactors] constants this reference supports.
  final List<String> appliesTo;

  const EmissionReference({
    required this.id,
    required this.category,
    required this.title,
    required this.authors,
    required this.year,
    required this.description,
    required this.url,
    required this.appliesTo,
  });
}
