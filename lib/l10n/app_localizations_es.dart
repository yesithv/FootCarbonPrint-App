// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'FootCarbonPrint';

  @override
  String get tagline => 'Conoce tu Huella. Cambia tu Mundo.';

  @override
  String get save => 'Guardar';

  @override
  String get next => 'Siguiente';

  @override
  String get skip => 'Saltar';

  @override
  String get goToTest => 'Ir al test';

  @override
  String get startTest => '¡Empezar mi test!';

  @override
  String get startTestNow => '¡Hacer el test ahora! 🚀';

  @override
  String get co2PerYear => 'toneladas CO₂/año';

  @override
  String get co2Unit => 't CO₂/año';

  @override
  String get moduleEstimate => 'Estimado de este módulo';

  @override
  String get saveModule => 'Guardar módulo';

  @override
  String get completedCheck => 'Completado ✓';

  @override
  String get tapToStart => 'Tocar para empezar';

  @override
  String get onb1Title => '¿Cuánto contaminas\nsin saberlo?';

  @override
  String get onb1Sub =>
      'La mayoría de personas emite más CO₂ del que cree. En menos de 7 minutos descubre tu impacto real en el planeta.';

  @override
  String get onb2Title => 'Tu huella,\nen datos reales';

  @override
  String get onb2Sub =>
      'Calculamos tu huella de carbono anual dividida por categorías: transporte, alimentación, hogar, consumo, residuos y agua.';

  @override
  String get onb3Title => 'Un plan de acción\nque sí funciona';

  @override
  String get onb3Sub =>
      'No solo medimos — te decimos exactamente qué cambiar y cuánto CO₂ ahorras con cada acción. Paso a paso.';

  @override
  String get tabTest => 'Mi Test';

  @override
  String get tabFootprint => 'Mi Huella';

  @override
  String get tabPlan => 'Plan';

  @override
  String get testHubTitle => 'Tu Auto-Test de\nHuella de Carbono';

  @override
  String get testHubSub => 'Completa los módulos para conocer tu impacto';

  @override
  String modulesProgress(int completed, int total) {
    return '$completed de $total módulos';
  }

  @override
  String get viewMyFootprint => 'Ver mi Huella de Carbono';

  @override
  String get learnBannerFirstTitle => '¿Primera vez aquí?';

  @override
  String get learnBannerFirstSub =>
      'Aprende qué es la huella de carbono en 2 minutos';

  @override
  String get learnBannerReturnTitle => 'Guía de Huella de Carbono';

  @override
  String get learnBannerReturnSub =>
      'Repasa los conceptos clave — 6 lecciones visuales';

  @override
  String get modTransport => 'Transporte';

  @override
  String get modTransportWeight => '28–35%';

  @override
  String get modFood => 'Alimentación';

  @override
  String get modFoodWeight => '25–30%';

  @override
  String get modHome => 'Hogar';

  @override
  String get modHomeWeight => '20–25%';

  @override
  String get modShopping => 'Consumo';

  @override
  String get modShoppingWeight => '10–15%';

  @override
  String get modWaste => 'Residuos';

  @override
  String get modWasteWeight => '5–8%';

  @override
  String get modWater => 'Agua';

  @override
  String get modWaterWeight => '~3%';

  @override
  String get dashEmptyTitle => 'Aún no tienes resultados';

  @override
  String get dashEmptySub =>
      'Completa al menos un módulo del test para ver tu huella de carbono aquí.';

  @override
  String get dashAppBarTitle => 'Tu Huella de Carbono';

  @override
  String get equivalencesTitle => 'Tu huella equivale a...';

  @override
  String get treesLabel => 'árboles\ntalados/año';

  @override
  String get bulbYearsLabel => 'años de\nbombilla';

  @override
  String get phoneChargesLabel => 'cargas de\nsmartphone';

  @override
  String get breakdownTitle => 'Desglose por categoría';

  @override
  String get benchmarkTitle => 'Comparativa global';

  @override
  String get yourFootprint => 'Tu huella';

  @override
  String get parisTarget => 'Meta París 2050';

  @override
  String get colombiaAvg => 'Colombia promedio';

  @override
  String get worldAvg => 'Promedio mundial';

  @override
  String get viewActionPlan => 'Ver mi Plan de Acción';

  @override
  String get ecoPoints => 'puntos eco';

  @override
  String nextLevelLabel(String emoji, String name) {
    return 'Siguiente: $emoji $name';
  }

  @override
  String ptsMore(int pts) {
    return '$pts pts más';
  }

  @override
  String get maxLevelReached => '¡Nivel máximo alcanzado! 🎉';

  @override
  String get myAchievements => 'Mis logros';

  @override
  String get shareMyLevel => 'Compartir mi nivel';

  @override
  String get shareSub => 'Descarga tu tarjeta eco y compártela en redes';

  @override
  String get lvlChampion => 'Campeón Verde';

  @override
  String get lvlConscious => 'Consciente';

  @override
  String get lvlOntrack => 'En Camino';

  @override
  String get lvlHigh => 'Alto Impacto';

  @override
  String get lvlCritical => 'Crítico';

  @override
  String get ecoLvlBeginner => 'Principiante';

  @override
  String get ecoLvlLearner => 'Aprendiz';

  @override
  String get ecoLvlConscious => 'Consciente';

  @override
  String get ecoLvlActivist => 'Activista';

  @override
  String get ecoLvlChampion => 'Eco-Campeón';

  @override
  String get badgeFirstStep => 'Primer Paso';

  @override
  String get badgeFirstStepDesc => 'Completa tu primer módulo del test';

  @override
  String get badgeExplorer => 'Explorador';

  @override
  String get badgeExplorerDesc => 'Completa 3 módulos del test';

  @override
  String get badgeCompletionist => 'Completista';

  @override
  String get badgeCompletionistDesc => 'Completa los 6 módulos del test';

  @override
  String get badgeEducated => 'Educado';

  @override
  String get badgeEducatedDesc => 'Termina la guía de aprendizaje';

  @override
  String get badgeConscious => 'Consciente';

  @override
  String get badgeConsciousDesc => 'Logra una huella menor a 3 toneladas';

  @override
  String get badgeChampion => 'Huella Ligera';

  @override
  String get badgeChampionDesc => 'Logra una huella menor a 1.5 toneladas';

  @override
  String get badgeCommitted => 'Comprometido';

  @override
  String get badgeCommittedDesc => 'Comprométete con al menos 1 acción';

  @override
  String get badgeActivist => 'Activista';

  @override
  String get badgeActivistDesc => 'Comprométete con 5 acciones del plan';

  @override
  String badgeLocked(String description) {
    return '🔒 $description';
  }

  @override
  String get actionPlanTitle => 'Plan de Acción';

  @override
  String get actionPlanEmptyTitle => 'Aún no tienes plan';

  @override
  String get actionPlanEmptySub =>
      'Completa al menos un módulo del test para ver tu plan de acción personalizado.';

  @override
  String get reductionTitle => '¿Cuánto puedes reducir?';

  @override
  String reductionSub(int pct) {
    return 'hasta un $pct% con las acciones de abajo';
  }

  @override
  String get actionsTitle => 'Tus top acciones por impacto';

  @override
  String get actionsSub => 'Ordenadas de mayor a menor reducción potencial';

  @override
  String get commit => 'Me comprometo';

  @override
  String get committedLabel => '✓ Comprometido';

  @override
  String get challengesTitle => 'Retos semanales 🎯';

  @override
  String get challengesSub => 'Pequeños cambios con gran impacto';

  @override
  String get actionFlightTitle => 'Eliminar 1 vuelo largo al año';

  @override
  String get actionFlightDesc =>
      'Un vuelo de larga distancia emite más CO₂ que 2 meses en auto.';

  @override
  String get actionFlexitarianTitle => 'Adoptar dieta flexitariana';

  @override
  String get actionFlexitarianDesc =>
      'Reducir carne a 2–3 veces por semana genera un gran impacto.';

  @override
  String get actionPublicTransportTitle =>
      'Usar transporte público 2 días/semana';

  @override
  String get actionPublicTransportDesc =>
      'Dejar el auto 2 días evita ~350 kg CO₂ al año.';

  @override
  String get actionLessBeefTitle => 'Dejar carne de res 3 días/semana';

  @override
  String get actionLessBeefDesc =>
      'La carne de res emite 27 kgCO₂/kg — la más alta de todos los alimentos.';

  @override
  String get actionLedTitle => 'Cambiar a bombillas LED';

  @override
  String get actionLedDesc =>
      'Las LED consumen 75% menos energía que las incandescentes.';

  @override
  String get actionShortShowerTitle => 'Duchas de máximo 5 minutos';

  @override
  String get actionShortShowerDesc =>
      'Reducir la ducha a 5 min con agua caliente evita 100 kgCO₂/año.';

  @override
  String get actionRecycleTitle => 'Separar residuos para reciclaje';

  @override
  String get actionRecycleDesc =>
      'El reciclaje evita la descomposición anaeróbica que genera metano.';

  @override
  String get actionSecondhandTitle => 'Comprar 50% ropa de segunda mano';

  @override
  String get actionSecondhandDesc =>
      'La industria textil es una de las más contaminantes del mundo.';

  @override
  String get actionCompostTitle => 'Compostar residuos orgánicos';

  @override
  String get actionCompostDesc =>
      'El compost evita que los residuos orgánicos generen metano en rellenos.';

  @override
  String get actionBikeTitle => 'Ir en bici o caminar al trabajo';

  @override
  String get actionBikeDesc => 'Cero emisiones + beneficios de salud.';

  @override
  String get challengeWeekLabel => 'Reto de la semana';

  @override
  String get challengeExpiresLabel => 'Expira este domingo';

  @override
  String challengePts(int pts) {
    return '+$pts pts';
  }

  @override
  String get challengeMarkDone => '¡Lo hice! Marcar como completado';

  @override
  String get challengeCompletedLabel => '¡Reto completado esta semana! 🎉';

  @override
  String get challengeCompletedSub => 'Sumaste +25 pts a tu nivel';

  @override
  String get challenge1 => 'Semana sin plástico de un solo uso';

  @override
  String get challengeDesc1 =>
      'Lleva bolsa reutilizable y rechaza vasos, pitillos y bolsas de plástico durante 7 días.';

  @override
  String get challengeEmoji1 => '🛍️';

  @override
  String get challenge2 => '7 días sin carne roja';

  @override
  String get challengeDesc2 =>
      'Reemplaza la carne de res por pollo, pescado, legumbres o tofu toda la semana.';

  @override
  String get challengeEmoji2 => '🥩';

  @override
  String get challenge3 => 'Ve en bici o camina 3 días esta semana';

  @override
  String get challengeDesc3 =>
      'Al menos 3 días esta semana deja el carro y usa bicicleta, patineta o tus pies.';

  @override
  String get challengeEmoji3 => '🚲';

  @override
  String get challenge4 => 'Ducha de máximo 5 minutos por 5 días';

  @override
  String get challengeDesc4 =>
      'Usa un cronómetro — 5 minutos máximo con agua caliente, durante 5 días seguidos.';

  @override
  String get challengeEmoji4 => '🚿';

  @override
  String get learnGuideTitle => 'Guía de Huella de Carbono';

  @override
  String get learnNext => 'Siguiente →';

  @override
  String get l1Title => 'El planeta\ntiene fiebre';

  @override
  String get l1Body =>
      'Imagina que la Tierra es tu cuerpo. Cuando tienes fiebre de solo 1°C, ya te sientes muy mal. La Tierra ya tiene 1.2°C más que hace 150 años… y sigue subiendo cada año.';

  @override
  String get l1FactLabel => 'DATO';

  @override
  String get l1Fact =>
      '2023 fue el año más caluroso jamás registrado. Los 10 más calurosos de la historia han sido en los últimos 10 años.';

  @override
  String get l1TempLow => 'Leve derretimiento de glaciares';

  @override
  String get l1TempNow => 'Donde estamos hoy 📍';

  @override
  String get l1TempHeat => 'Olas de calor extremas';

  @override
  String get l1TempCrisis => 'Civilización en riesgo';

  @override
  String get l2Title => 'El gas\ninvisible';

  @override
  String get l2Body =>
      'Cuando quemas gasolina, gas o carbón — o cuando se descompone comida — se libera CO₂. Este gas actúa como una manta: deja entrar el calor del sol, pero no lo deja salir. El planeta se calienta.';

  @override
  String get l2FactLabel => 'ANALOGÍA';

  @override
  String get l2Fact =>
      'Es como dejar el carro encendido dentro de un garaje cerrado. Solo que el garaje es toda la atmósfera de la Tierra.';

  @override
  String get l2Step1 => 'Sol envía\ncalor';

  @override
  String get l2Step2 => 'Tierra\nrecibe';

  @override
  String get l2Step3 => 'CO₂ atrapa\nel calor';

  @override
  String get l2Result => '🌡️ El calor no puede escapar → temperatura sube';

  @override
  String get l3Title => 'Tu huella\npersonal';

  @override
  String get l3Body =>
      'La \"huella de carbono\" es el total de CO₂ que produces tú en un año. Incluye todo lo que consumes: el bus que tomas, la hamburguesa que comes, la camiseta que compras, la ducha caliente que te das.';

  @override
  String get l3FactLabel => 'EN COLOMBIA';

  @override
  String get l3Fact =>
      'Un colombiano produce en promedio 1.8 toneladas de CO₂ al año. El promedio mundial es 4.7 t. La meta para salvar el planeta es llegar a 2 t antes de 2030.';

  @override
  String get l3ColombiaLabel => 'Colombia\npromedio';

  @override
  String get l3WorldLabel => 'Mundo\npromedio';

  @override
  String get l3TargetLabel => 'Meta\n2030 🎯';

  @override
  String get l4Title => '¿De dónde\nviene?';

  @override
  String get l4Body =>
      'No solo los carros contaminan. Tu huella viene de 6 grandes categorías de tu vida cotidiana. Algunas sorprenden: la carne de res emite más CO₂ que manejar un carro.';

  @override
  String get l4FactLabel => 'LAS 6 CATEGORÍAS';

  @override
  String get l4Fact =>
      'Transporte y alimentación juntos representan más del 55% de tu huella total.';

  @override
  String get l5Title => '¿Cuánto\nes mucho?';

  @override
  String get l5Body =>
      'Hay una meta global: para evitar los peores efectos del cambio climático, cada persona en el mundo necesita llegar a menos de 2 toneladas de CO₂ por año para 2030.';

  @override
  String get l5FactLabel => 'COMPARATIVA';

  @override
  String get l5Fact =>
      'Un ciudadano de EE.UU. produce 15 t/año. Un alemán: 9 t. Un colombiano: 1.8 t. Pero la calidad de vida no tiene que bajar para reducir la huella.';

  @override
  String get l6Title => 'Tú puedes\ncambiar algo';

  @override
  String get l6Body =>
      'No necesitas ser un activista ni cambiar tu vida de un día para otro. Pequeños cambios en tus hábitos de transporte, alimentación y hogar pueden reducir tu huella hasta un 40%.';

  @override
  String get l6FactLabel => 'EL PRIMER PASO';

  @override
  String get l6Fact =>
      'Conocer tu huella es el primer paso. Lo que no se mide, no se puede mejorar. ¡Haz el test ahora!';

  @override
  String get l6Action1 => 'Comer menos carne';

  @override
  String get l6Action2 => 'Usar transporte público';

  @override
  String get l6Action3 => 'Evitar 1 vuelo largo';

  @override
  String get l6Action4 => 'Cambiar a LED';

  @override
  String get l6ActionsLabel => 'Acciones de alto impacto:';

  @override
  String get profileCardTitle => 'Mi Tarjeta Eco';

  @override
  String get profileCardPreview =>
      'Previsualización — comparte tu nivel en redes 🌍';

  @override
  String get photoDialogTitle => '¿Añadir tu foto?';

  @override
  String get photoDialogContent =>
      'Puedes personalizar la tarjeta con tu foto de perfil, o dejar el emoji de tu nivel.';

  @override
  String get emojiOnly => 'Solo emoji';

  @override
  String get choosePhoto => 'Elegir foto';

  @override
  String get addPhoto => 'Añadir foto';

  @override
  String get changePhoto => 'Cambiar foto';

  @override
  String get generating => 'Generando...';

  @override
  String get downloadPng => 'Descargar PNG';

  @override
  String get cardDownloaded => '¡Tarjeta descargada! 🌿';

  @override
  String get downloadHint =>
      'La imagen se descarga en 1080×1080 px,\nideal para Instagram, WhatsApp y Twitter.';

  @override
  String get cardFooterText => 'Conoce tu huella. Cambia tu mundo.';

  @override
  String get statsModules => 'Módulos';

  @override
  String get statsAchievements => 'Logros';

  @override
  String get transportModuleTitle => 'Transporte';

  @override
  String get transportModuleWeight => '28–35% de tu huella';

  @override
  String get transportQ1 => '¿Cuál es tu medio de transporte principal?';

  @override
  String get transportQ2 => '¿Cuántos km recorres por semana?';

  @override
  String transportKmHint(int km) {
    return '$km km/semana';
  }

  @override
  String get transportQ3 => '¿Cuántos vuelos haces al año?';

  @override
  String get flightShort => 'Cortos (< 3h)';

  @override
  String get flightMedium => 'Medios (3–6h)';

  @override
  String get flightLong => 'Largos (> 6h)';

  @override
  String get vehicleGasoline => 'Gasolina';

  @override
  String get vehicleDiesel => 'Diésel';

  @override
  String get vehicleHybrid => 'Híbrido';

  @override
  String get vehicleElectric => 'Eléctrico';

  @override
  String get vehicleMotorcycle => 'Moto';

  @override
  String get vehicleBus => 'Bus/Metro';

  @override
  String get vehicleBicycle => 'Bicicleta';

  @override
  String get vehicleWalking => 'A pie';

  @override
  String get foodModuleTitle => 'Alimentación';

  @override
  String get foodModuleWeight => '25–30% de tu huella';

  @override
  String get foodQ1 => '¿Cómo describirías tu dieta?';

  @override
  String get foodQ2 => '¿Cuántas veces comes carne de res por semana?';

  @override
  String foodBeefHint(int n) {
    return '$n veces';
  }

  @override
  String get foodQ3 => '¿Cuánto desperdicias de comida?';

  @override
  String get foodQ4 => '¿Consumes alimentos locales y de temporada?';

  @override
  String get dietVegan => 'Vegano';

  @override
  String get dietVeganSub => 'Solo plantas';

  @override
  String get dietVegetarian => 'Vegetariano';

  @override
  String get dietVegetarianSub => 'Sin carne';

  @override
  String get dietFlexitarian => 'Flexitariano';

  @override
  String get dietFlexitarianSub => 'Poca carne';

  @override
  String get dietOmnivore => 'Omnívoro';

  @override
  String get dietOmnivoreSub => 'Carne regular';

  @override
  String get dietCarnivore => 'Alta en carne';

  @override
  String get dietCarnivoreSub => 'Carne a diario';

  @override
  String get wasteNone => 'Casi nada';

  @override
  String get wasteSome => 'Algo';

  @override
  String get wasteLot => 'Bastante';

  @override
  String get wasteMuch => 'Mucho';

  @override
  String get foodLocalTitle => 'Principalmente local y de temporada';

  @override
  String get foodLocalSub => 'Reduce hasta 0.1 tCO₂/año';

  @override
  String get homeModuleTitle => 'Hogar y Energía';

  @override
  String get homeModuleWeight => '20–25% de tu huella';

  @override
  String get homeQ1 => '¿Cuántas personas viven en tu hogar?';

  @override
  String homePersonsHint(int n, String plural) {
    return '$n persona$plural';
  }

  @override
  String get homeQ2 => '¿Cuál es tu fuente de energía principal?';

  @override
  String get homeQ3 => '¿Cuántos kWh consumes al mes?';

  @override
  String homeKwhHint(int n) {
    return '$n kWh';
  }

  @override
  String get homeKwhAvg => 'Promedio hogar Colombia: 170–250 kWh/mes';

  @override
  String get homeQ4 => '¿Tienes aire acondicionado o calefacción?';

  @override
  String get homeACTitle => 'Sí, uso AC / calefacción';

  @override
  String homeACHoursHint(int n) {
    return '$n horas/día';
  }

  @override
  String get energyGrid => 'Red eléctrica';

  @override
  String get energySolar => 'Solar';

  @override
  String get energyGas => 'Gas natural';

  @override
  String get energyMixed => 'Mixto';

  @override
  String get shoppingModuleTitle => 'Consumo';

  @override
  String get shoppingModuleWeight => '10–15% de tu huella';

  @override
  String get shoppingQ1 => '¿Cuántas prendas de ropa compras al mes?';

  @override
  String shoppingClothingHint(int n) {
    return '$n prendas';
  }

  @override
  String get shoppingQ2 => '¿Dispositivos electrónicos nuevos por año?';

  @override
  String shoppingElectronicsHint(int n) {
    return '$n dispositivos';
  }

  @override
  String get shoppingQ3 => '¿Cuántos paquetes de e-commerce recibes al mes?';

  @override
  String shoppingPackagesHint(int n) {
    return '$n paquetes';
  }

  @override
  String get shoppingQ4 => '¿Compras ropa o artículos de segunda mano?';

  @override
  String get shoppingSecondHandTitle =>
      'Sí, compro segunda mano frecuentemente';

  @override
  String get shoppingSecondHandSub => 'Reduce tu huella de consumo hasta 10%';

  @override
  String get wasteModuleTitle => 'Residuos';

  @override
  String get wasteModuleWeight => '5–8% de tu huella';

  @override
  String get wasteQ1 => '¿Cuántas bolsas de basura generas por semana?';

  @override
  String wasteBagsHint(int n, String plural) {
    return '$n bolsa$plural';
  }

  @override
  String get wasteQ2 => '¿Separas los residuos para reciclaje?';

  @override
  String get wasteSeparateTitle => 'Sí, separo plástico, papel y vidrio';

  @override
  String get wasteSeparateSub => 'Reduce tu huella de residuos un 30%';

  @override
  String get wasteQ3 => '¿Compostas residuos orgánicos?';

  @override
  String get wasteCompostTitle => 'Sí, hago compost';

  @override
  String get wasteCompostSub => 'Reduce emisiones de metano del relleno';

  @override
  String get waterModuleTitle => 'Agua';

  @override
  String get waterModuleWeight => '~3% de tu huella';

  @override
  String get waterQ1 => '¿Cuántos minutos dura tu ducha promedio?';

  @override
  String waterMinutesHint(int n) {
    return '$n minutos';
  }

  @override
  String get waterQ2 => '¿A qué temperatura te duchas normalmente?';

  @override
  String get waterQ3 => '¿Riegas jardín o zonas verdes en casa?';

  @override
  String get waterGardenTitle => 'Sí, tengo jardín o riego plantas';

  @override
  String get tempCold => 'Fría';

  @override
  String get tempColdSub => 'Sin calentador';

  @override
  String get tempWarm => 'Tibia';

  @override
  String get tempWarmSub => 'Calentador moderado';

  @override
  String get tempHot => 'Caliente';

  @override
  String get tempHotSub => 'Calentador máximo';

  @override
  String get cancel => 'Cancelar';

  @override
  String greetingWithName(String name) {
    return 'Hola, $name 👋';
  }

  @override
  String get greetingEmpty => 'Hola 👋';

  @override
  String get addYourName => 'Añade tu nombre';

  @override
  String get nameDialogTitle => '¿Cómo te llamas?';

  @override
  String get nameDialogHint => 'Tu nombre';

  @override
  String get nameOnCard => 'nombre en la tarjeta';

  @override
  String get historyTitle => 'Evolución de tu huella';

  @override
  String historyMeasurements(int n) {
    return '$n mediciones';
  }

  @override
  String get historyEmptyTitle => 'Aún sin historial';

  @override
  String get historyEmptySub =>
      'Actualiza tus módulos en distintos días para ver cómo evoluciona tu huella.';

  @override
  String get historyOneMeasurement => '¡Primera medición registrada! 🎉';

  @override
  String get historyOneSub =>
      'Vuelve mañana y actualiza un módulo para ver tu evolución.';

  @override
  String historyImproved(String pct) {
    return '↓ $pct% desde tu primera medición';
  }

  @override
  String historyWorsened(String pct) {
    return '↑ $pct% desde tu primera medición';
  }

  @override
  String get offsetTitle => '¿Cómo compensar tu huella?';

  @override
  String get offsetSubtitle =>
      'Mientras reduces, puedes neutralizar el CO₂ restante';

  @override
  String offsetTreesValue(int n) {
    return '$n árboles';
  }

  @override
  String get offsetTreesLabel => 'para absorber tu huella anual';

  @override
  String offsetCostValue(int usd) {
    return '~$usd USD/año';
  }

  @override
  String offsetCostMonthly(int usd) {
    return '~$usd USD/mes';
  }

  @override
  String get offsetCostLabel => 'en créditos de carbono certificados';

  @override
  String get offsetReduceFirst => 'Reduce primero, compensa después';

  @override
  String get offsetReduceFirstDesc =>
      'Los créditos de carbono son un complemento, no un sustituto de reducir tu huella.';

  @override
  String get offsetPlatformsTitle => 'Plataformas certificadas';

  @override
  String get offsetDisclaimer =>
      '* Estimación basada en mercado voluntario de carbono (~\$20/t CO₂) y absorción de árbol maduro (~21 kg CO₂/año).';

  @override
  String get resultsTitle => '¡Diagnóstico completado!';

  @override
  String get resultsSub =>
      'Has completado los 6 módulos de tu huella de carbono';

  @override
  String get resultsYourFootprint => 'Tu huella de carbono anual';

  @override
  String get resultsCompareTitle => '¿Cómo te comparas?';

  @override
  String get resultsYou => 'Tú';

  @override
  String get resultsParis => 'Obj. París';

  @override
  String get resultsColombia => 'Colombia';

  @override
  String get resultsWorld => 'Mundo';

  @override
  String get resultsTopSources => 'Principales fuentes de emisión';

  @override
  String get resultsAchievements => 'Tus logros';

  @override
  String resultsEcoPoints(int points) {
    return '$points puntos EcoScore';
  }

  @override
  String get resultsBadgesUnlocked => 'logros desbloqueados';

  @override
  String get resultsViewDashboard => 'Ver Dashboard completo';

  @override
  String get resultsViewPlan => 'Crear mi Plan de Acción';

  @override
  String get resultsViewAgain => 'Ver mis resultados 🏆';

  @override
  String get exportResult => 'Exportar imagen';

  @override
  String get downloadImage => 'Descargar imagen';
}
