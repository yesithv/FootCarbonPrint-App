// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'FootCarbonPrint';

  @override
  String get tagline => 'Conheça sua pegada. Mude seu mundo.';

  @override
  String get save => 'Salvar';

  @override
  String get next => 'Próximo';

  @override
  String get skip => 'Pular';

  @override
  String get goToTest => 'Ir para o teste';

  @override
  String get startTest => 'Começar meu teste!';

  @override
  String get startTestNow => 'Fazer o teste agora! 🚀';

  @override
  String get co2PerYear => 'toneladas CO₂/ano';

  @override
  String get co2Unit => 't CO₂/ano';

  @override
  String get moduleEstimate => 'Estimativa deste módulo';

  @override
  String get saveModule => 'Salvar módulo';

  @override
  String get completedCheck => 'Concluído ✓';

  @override
  String get tapToStart => 'Toque para começar';

  @override
  String get onb1Title => 'Quanto você polui\nsem saber?';

  @override
  String get onb1Sub =>
      'A maioria das pessoas emite mais CO₂ do que imagina. Em menos de 7 minutos, descubra seu impacto real no planeta.';

  @override
  String get onb2Title => 'Sua pegada,\nem dados reais';

  @override
  String get onb2Sub =>
      'Calculamos sua pegada de carbono anual dividida por categorias: transporte, alimentação, casa, consumo, resíduos e água.';

  @override
  String get onb3Title => 'Um plano de ação\nque realmente funciona';

  @override
  String get onb3Sub =>
      'Não apenas medimos — dizemos exatamente o que mudar e quanto CO₂ você economiza com cada ação. Passo a passo.';

  @override
  String get tabTest => 'Meu Teste';

  @override
  String get tabFootprint => 'Minha Pegada';

  @override
  String get tabPlan => 'Plano';

  @override
  String get testHubTitle => 'Seu Autoteste de\nPegada de Carbono';

  @override
  String get testHubSub => 'Complete os módulos para descobrir seu impacto';

  @override
  String modulesProgress(int completed, int total) {
    return '$completed de $total módulos';
  }

  @override
  String get viewMyFootprint => 'Ver Minha Pegada de Carbono';

  @override
  String get learnBannerFirstTitle => 'Primeira vez aqui?';

  @override
  String get learnBannerFirstSub =>
      'Aprenda sobre pegada de carbono em 2 minutos';

  @override
  String get learnBannerReturnTitle => 'Guia de Pegada de Carbono';

  @override
  String get learnBannerReturnSub =>
      'Revise os conceitos-chave — 6 lições visuais';

  @override
  String get modTransport => 'Transporte';

  @override
  String get modTransportWeight => '28–35%';

  @override
  String get modFood => 'Alimentação';

  @override
  String get modFoodWeight => '25–30%';

  @override
  String get modHome => 'Casa';

  @override
  String get modHomeWeight => '20–25%';

  @override
  String get modShopping => 'Consumo';

  @override
  String get modShoppingWeight => '10–15%';

  @override
  String get modWaste => 'Resíduos';

  @override
  String get modWasteWeight => '5–8%';

  @override
  String get modWater => 'Água';

  @override
  String get modWaterWeight => '~3%';

  @override
  String get dashEmptyTitle => 'Sem resultados ainda';

  @override
  String get dashEmptySub =>
      'Complete pelo menos um módulo do teste para ver sua pegada de carbono aqui.';

  @override
  String get dashAppBarTitle => 'Sua Pegada de Carbono';

  @override
  String get equivalencesTitle => 'Sua pegada equivale a...';

  @override
  String get treesLabel => 'árvores\ncortadas/ano';

  @override
  String get bulbYearsLabel => 'anos de\nlâmpada';

  @override
  String get phoneChargesLabel => 'carregamentos\nde smartphone';

  @override
  String get breakdownTitle => 'Divisão por categoria';

  @override
  String get benchmarkTitle => 'Comparação global';

  @override
  String get yourFootprint => 'Sua pegada';

  @override
  String get parisTarget => 'Meta Paris 2050';

  @override
  String get colombiaAvg => 'Média da Colômbia';

  @override
  String get worldAvg => 'Média mundial';

  @override
  String get viewActionPlan => 'Ver Plano de Ação';

  @override
  String get ecoPoints => 'pontos eco';

  @override
  String nextLevelLabel(String emoji, String name) {
    return 'Próximo: $emoji $name';
  }

  @override
  String ptsMore(int pts) {
    return '$pts pts a mais';
  }

  @override
  String get maxLevelReached => 'Nível máximo alcançado! 🎉';

  @override
  String get myAchievements => 'Minhas conquistas';

  @override
  String get shareMyLevel => 'Compartilhar meu nível';

  @override
  String get shareSub => 'Baixe seu cartão eco e compartilhe nas redes sociais';

  @override
  String get lvlChampion => 'Campeão Verde';

  @override
  String get lvlConscious => 'Consciente';

  @override
  String get lvlOntrack => 'No Caminho';

  @override
  String get lvlHigh => 'Alto Impacto';

  @override
  String get lvlCritical => 'Crítico';

  @override
  String get ecoLvlBeginner => 'Iniciante';

  @override
  String get ecoLvlLearner => 'Aprendiz';

  @override
  String get ecoLvlConscious => 'Consciente';

  @override
  String get ecoLvlActivist => 'Ativista';

  @override
  String get ecoLvlChampion => 'Eco-Campeão';

  @override
  String get badgeFirstStep => 'Primeiro Passo';

  @override
  String get badgeFirstStepDesc => 'Complete seu primeiro módulo do teste';

  @override
  String get badgeExplorer => 'Explorador';

  @override
  String get badgeExplorerDesc => 'Complete 3 módulos do teste';

  @override
  String get badgeCompletionist => 'Completista';

  @override
  String get badgeCompletionistDesc => 'Complete os 6 módulos do teste';

  @override
  String get badgeEducated => 'Educado';

  @override
  String get badgeEducatedDesc => 'Termine o guia de aprendizagem';

  @override
  String get badgeConscious => 'Consciente';

  @override
  String get badgeConsciousDesc => 'Alcance uma pegada menor que 3 toneladas';

  @override
  String get badgeChampion => 'Pegada Leve';

  @override
  String get badgeChampionDesc => 'Alcance uma pegada menor que 1,5 toneladas';

  @override
  String get badgeCommitted => 'Comprometido';

  @override
  String get badgeCommittedDesc => 'Comprometa-se com pelo menos 1 ação';

  @override
  String get badgeActivist => 'Ativista';

  @override
  String get badgeActivistDesc => 'Comprometa-se com 5 ações do plano';

  @override
  String badgeLocked(String description) {
    return '🔒 $description';
  }

  @override
  String get actionPlanTitle => 'Plano de Ação';

  @override
  String get actionPlanEmptyTitle => 'Sem plano ainda';

  @override
  String get actionPlanEmptySub =>
      'Complete pelo menos um módulo do teste para ver seu plano de ação personalizado.';

  @override
  String get reductionTitle => 'Quanto você pode reduzir?';

  @override
  String reductionSub(int pct) {
    return 'até $pct% com as ações abaixo';
  }

  @override
  String get actionsTitle => 'Suas principais ações por impacto';

  @override
  String get actionsSub =>
      'Ordenadas do maior para o menor potencial de redução';

  @override
  String get commit => 'Me comprometo';

  @override
  String get committedLabel => '✓ Comprometido';

  @override
  String get challengesTitle => 'Desafios semanais 🎯';

  @override
  String get challengesSub => 'Pequenas mudanças com grande impacto';

  @override
  String get actionFlightTitle => 'Eliminar 1 voo longo por ano';

  @override
  String get actionFlightDesc =>
      'Um voo de longa distância emite mais CO₂ do que 2 meses de carro.';

  @override
  String get actionFlexitarianTitle => 'Adotar dieta flexitariana';

  @override
  String get actionFlexitarianDesc =>
      'Reduzir a carne para 2–3 vezes por semana tem um grande impacto.';

  @override
  String get actionPublicTransportTitle =>
      'Usar transporte público 2 dias/semana';

  @override
  String get actionPublicTransportDesc =>
      'Deixar o carro 2 dias evita ~350 kg CO₂ por ano.';

  @override
  String get actionLessBeefTitle => 'Evitar carne bovina 3 dias/semana';

  @override
  String get actionLessBeefDesc =>
      'A carne bovina emite 27 kgCO₂/kg — a mais alta de todos os alimentos.';

  @override
  String get actionLedTitle => 'Trocar para lâmpadas LED';

  @override
  String get actionLedDesc =>
      'As LEDs consomem 75% menos energia do que as incandescentes.';

  @override
  String get actionShortShowerTitle => 'Banhos de no máximo 5 minutos';

  @override
  String get actionShortShowerDesc =>
      'Reduzir o banho a 5 min com água quente economiza 100 kgCO₂/ano.';

  @override
  String get actionRecycleTitle => 'Separar resíduos para reciclagem';

  @override
  String get actionRecycleDesc =>
      'A reciclagem evita a decomposição anaeróbica que produz metano.';

  @override
  String get actionSecondhandTitle => 'Comprar 50% de roupas usadas';

  @override
  String get actionSecondhandDesc =>
      'A indústria têxtil é uma das mais poluentes do mundo.';

  @override
  String get actionCompostTitle => 'Compostar resíduos orgânicos';

  @override
  String get actionCompostDesc =>
      'A compostagem evita que resíduos orgânicos produzam metano em aterros.';

  @override
  String get actionBikeTitle => 'Ir de bicicleta ou a pé ao trabalho';

  @override
  String get actionBikeDesc => 'Zero emissões + benefícios para a saúde.';

  @override
  String get challengeWeekLabel => 'Desafio da semana';

  @override
  String get challengeExpiresLabel => 'Expira neste domingo';

  @override
  String challengePts(int pts) {
    return '+$pts pts';
  }

  @override
  String get challengeMarkDone => 'Fiz isso! Marcar como concluído';

  @override
  String get challengeCompletedLabel => 'Desafio concluído esta semana! 🎉';

  @override
  String get challengeCompletedSub => 'Você ganhou +25 pts';

  @override
  String get challenge1 => 'Uma semana sem plástico descartável';

  @override
  String get challengeDesc1 =>
      'Leve uma sacola reutilizável e recuse copos, canudos e sacolas plásticas por 7 dias.';

  @override
  String get challengeEmoji1 => '🛍️';

  @override
  String get challenge2 => '7 dias sem carne vermelha';

  @override
  String get challengeDesc2 =>
      'Substitua a carne bovina por frango, peixe, legumes ou tofu durante a semana.';

  @override
  String get challengeEmoji2 => '🥩';

  @override
  String get challenge3 => 'Vá de bicicleta ou a pé 3 dias esta semana';

  @override
  String get challengeDesc3 =>
      'Pelo menos 3 dias esta semana, deixe o carro e use bicicleta, patinete ou seus pés.';

  @override
  String get challengeEmoji3 => '🚲';

  @override
  String get challenge4 => 'Banho de no máximo 5 minutos por 5 dias';

  @override
  String get challengeDesc4 =>
      'Use um cronômetro — no máximo 5 minutos com água quente, por 5 dias consecutivos.';

  @override
  String get challengeEmoji4 => '🚿';

  @override
  String get learnGuideTitle => 'Guia de Pegada de Carbono';

  @override
  String get learnNext => 'Próximo →';

  @override
  String get l1Title => 'O planeta\nestá com febre';

  @override
  String get l1Body =>
      'Imagine que a Terra é o seu corpo. Quando você tem febre de apenas 1°C, já se sente muito mal. A Terra já está 1,2°C mais quente do que há 150 anos… e continua subindo a cada ano.';

  @override
  String get l1FactLabel => 'FATO';

  @override
  String get l1Fact =>
      '2023 foi o ano mais quente já registrado. Os 10 anos mais quentes da história ocorreram nos últimos 10 anos.';

  @override
  String get l1TempLow => 'Leve derretimento de geleiras';

  @override
  String get l1TempNow => 'Onde estamos hoje 📍';

  @override
  String get l1TempHeat => 'Ondas de calor extremas';

  @override
  String get l1TempCrisis => 'Civilização em risco';

  @override
  String get l2Title => 'O gás\ninvisível';

  @override
  String get l2Body =>
      'Quando você queima gasolina, gás ou carvão — ou quando alimentos se decompõem — CO₂ é liberado. Esse gás age como um cobertor: deixa o calor do sol entrar, mas não deixa sair. O planeta esquenta.';

  @override
  String get l2FactLabel => 'ANALOGIA';

  @override
  String get l2Fact =>
      'É como deixar o carro ligado dentro de uma garagem fechada. Só que a garagem é toda a atmosfera da Terra.';

  @override
  String get l2Step1 => 'Sol envia\ncalor';

  @override
  String get l2Step2 => 'Terra\nrecebe';

  @override
  String get l2Step3 => 'CO₂ retém\no calor';

  @override
  String get l2Result => '🌡️ O calor não pode escapar → temperatura sobe';

  @override
  String get l3Title => 'Sua pegada\npessoal';

  @override
  String get l3Body =>
      'A \"pegada de carbono\" é o total de CO₂ que você produz em um ano. Inclui tudo o que você consome: o ônibus que pega, o hambúrguer que come, a camiseta que compra, o banho quente que toma.';

  @override
  String get l3FactLabel => 'NA COLÔMBIA';

  @override
  String get l3Fact =>
      'Um colombiano produz em média 1,8 toneladas de CO₂ por ano. A média mundial é de 4,7 t. A meta para salvar o planeta é chegar a 2 t antes de 2030.';

  @override
  String get l3ColombiaLabel => 'Colômbia\nmédia';

  @override
  String get l3WorldLabel => 'Mundo\nmédia';

  @override
  String get l3TargetLabel => 'Meta\n2030 🎯';

  @override
  String get l4Title => 'De onde\nvem?';

  @override
  String get l4Body =>
      'Não são apenas os carros que poluem. Sua pegada vem de 6 grandes categorias do seu dia a dia. Algumas surpreendem: a carne bovina emite mais CO₂ do que dirigir um carro.';

  @override
  String get l4FactLabel => 'AS 6 CATEGORIAS';

  @override
  String get l4Fact =>
      'Transporte e alimentação juntos representam mais de 55% da sua pegada total.';

  @override
  String get l5Title => 'Quanto\né demais?';

  @override
  String get l5Body =>
      'Existe uma meta global: para evitar os piores efeitos das mudanças climáticas, cada pessoa no mundo precisa chegar a menos de 2 toneladas de CO₂ por ano até 2030.';

  @override
  String get l5FactLabel => 'COMPARAÇÃO';

  @override
  String get l5Fact =>
      'Um americano produz 15 t/ano. Um alemão: 9 t. Um colombiano: 1,8 t. Mas a qualidade de vida não precisa cair para reduzir a pegada.';

  @override
  String get l6Title => 'Você pode\nmudar algo';

  @override
  String get l6Body =>
      'Você não precisa ser um ativista nem mudar sua vida da noite para o dia. Pequenas mudanças nos seus hábitos de transporte, alimentação e casa podem reduzir sua pegada em até 40%.';

  @override
  String get l6FactLabel => 'O PRIMEIRO PASSO';

  @override
  String get l6Fact =>
      'Conhecer sua pegada é o primeiro passo. O que não se mede, não pode ser melhorado. Faça o teste agora!';

  @override
  String get l6Action1 => 'Comer menos carne';

  @override
  String get l6Action2 => 'Usar transporte público';

  @override
  String get l6Action3 => 'Evitar 1 voo longo';

  @override
  String get l6Action4 => 'Trocar para LED';

  @override
  String get l6ActionsLabel => 'Ações de alto impacto:';

  @override
  String get profileCardTitle => 'Meu Cartão Eco';

  @override
  String get profileCardPreview =>
      'Pré-visualização — compartilhe seu nível nas redes 🌍';

  @override
  String get photoDialogTitle => 'Adicionar sua foto?';

  @override
  String get photoDialogContent =>
      'Você pode personalizar o cartão com sua foto de perfil, ou usar apenas o emoji do seu nível.';

  @override
  String get emojiOnly => 'Apenas emoji';

  @override
  String get choosePhoto => 'Escolher foto';

  @override
  String get addPhoto => 'Adicionar foto';

  @override
  String get changePhoto => 'Trocar foto';

  @override
  String get generating => 'Gerando...';

  @override
  String get downloadPng => 'Baixar PNG';

  @override
  String get cardDownloaded => 'Cartão baixado! 🌿';

  @override
  String get downloadHint =>
      'A imagem é baixada em 1080×1080 px,\nperfeita para Instagram, WhatsApp e Twitter.';

  @override
  String get cardFooterText => 'Conheça sua pegada. Mude seu mundo.';

  @override
  String get statsModules => 'Módulos';

  @override
  String get statsAchievements => 'Conquistas';

  @override
  String get transportModuleTitle => 'Transporte';

  @override
  String get transportModuleWeight => '28–35% da sua pegada';

  @override
  String get transportQ1 => 'Qual é o seu principal meio de transporte?';

  @override
  String get transportQ2 => 'Quantos km você percorre por semana?';

  @override
  String transportKmHint(int km) {
    return '$km km/semana';
  }

  @override
  String get transportQ3 => 'Quantos voos você faz por ano?';

  @override
  String get flightShort => 'Curtos (< 3h)';

  @override
  String get flightMedium => 'Médios (3–6h)';

  @override
  String get flightLong => 'Longos (> 6h)';

  @override
  String get vehicleGasoline => 'Gasolina';

  @override
  String get vehicleDiesel => 'Diesel';

  @override
  String get vehicleHybrid => 'Híbrido';

  @override
  String get vehicleElectric => 'Elétrico';

  @override
  String get vehicleMotorcycle => 'Moto';

  @override
  String get vehicleBus => 'Ônibus/Metrô';

  @override
  String get vehicleBicycle => 'Bicicleta';

  @override
  String get vehicleWalking => 'A pé';

  @override
  String get foodModuleTitle => 'Alimentação';

  @override
  String get foodModuleWeight => '25–30% da sua pegada';

  @override
  String get foodQ1 => 'Como você descreveria sua dieta?';

  @override
  String get foodQ2 => 'Quantas vezes por semana você come carne bovina?';

  @override
  String foodBeefHint(int n) {
    return '$n vezes';
  }

  @override
  String get foodQ3 => 'Quanto alimento você desperdiça?';

  @override
  String get foodQ4 => 'Você consome alimentos locais e sazonais?';

  @override
  String get dietVegan => 'Vegano';

  @override
  String get dietVeganSub => 'Apenas plantas';

  @override
  String get dietVegetarian => 'Vegetariano';

  @override
  String get dietVegetarianSub => 'Sem carne';

  @override
  String get dietFlexitarian => 'Flexitariano';

  @override
  String get dietFlexitarianSub => 'Pouca carne';

  @override
  String get dietOmnivore => 'Onívoro';

  @override
  String get dietOmnivoreSub => 'Carne regular';

  @override
  String get dietCarnivore => 'Rica em carne';

  @override
  String get dietCarnivoreSub => 'Carne diariamente';

  @override
  String get wasteNone => 'Quase nada';

  @override
  String get wasteSome => 'Um pouco';

  @override
  String get wasteLot => 'Bastante';

  @override
  String get wasteMuch => 'Muito';

  @override
  String get foodLocalTitle => 'Principalmente local e sazonal';

  @override
  String get foodLocalSub => 'Reduz até 0,1 tCO₂/ano';

  @override
  String get homeModuleTitle => 'Casa e Energia';

  @override
  String get homeModuleWeight => '20–25% da sua pegada';

  @override
  String get homeQ1 => 'Quantas pessoas moram na sua casa?';

  @override
  String homePersonsHint(int n, String plural) {
    return '$n pessoa$plural';
  }

  @override
  String get homeQ2 => 'Qual é a sua principal fonte de energia?';

  @override
  String get homeQ3 => 'Quantos kWh você consome por mês?';

  @override
  String homeKwhHint(int n) {
    return '$n kWh';
  }

  @override
  String get homeKwhAvg => 'Média residencial: 170–250 kWh/mês';

  @override
  String get homeQ4 => 'Você tem ar-condicionado ou aquecimento?';

  @override
  String get homeACTitle => 'Sim, uso AC / aquecimento';

  @override
  String homeACHoursHint(int n) {
    return '$n horas/dia';
  }

  @override
  String get energyGrid => 'Rede elétrica';

  @override
  String get energySolar => 'Solar';

  @override
  String get energyGas => 'Gás natural';

  @override
  String get energyMixed => 'Misto';

  @override
  String get shoppingModuleTitle => 'Consumo';

  @override
  String get shoppingModuleWeight => '10–15% da sua pegada';

  @override
  String get shoppingQ1 => 'Quantas peças de roupa você compra por mês?';

  @override
  String shoppingClothingHint(int n) {
    return '$n peças';
  }

  @override
  String get shoppingQ2 => 'Dispositivos eletrônicos novos por ano?';

  @override
  String shoppingElectronicsHint(int n) {
    return '$n dispositivos';
  }

  @override
  String get shoppingQ3 => 'Quantos pacotes de e-commerce você recebe por mês?';

  @override
  String shoppingPackagesHint(int n) {
    return '$n pacotes';
  }

  @override
  String get shoppingQ4 => 'Você compra roupas ou itens de segunda mão?';

  @override
  String get shoppingSecondHandTitle => 'Sim, compro usado frequentemente';

  @override
  String get shoppingSecondHandSub => 'Reduz sua pegada de consumo em até 10%';

  @override
  String get wasteModuleTitle => 'Resíduos';

  @override
  String get wasteModuleWeight => '5–8% da sua pegada';

  @override
  String get wasteQ1 => 'Quantos sacos de lixo você gera por semana?';

  @override
  String wasteBagsHint(int n, String plural) {
    return '$n saco$plural';
  }

  @override
  String get wasteQ2 => 'Você separa os resíduos para reciclagem?';

  @override
  String get wasteSeparateTitle => 'Sim, separo plástico, papel e vidro';

  @override
  String get wasteSeparateSub => 'Reduz sua pegada de resíduos em 30%';

  @override
  String get wasteQ3 => 'Você compostiza resíduos orgânicos?';

  @override
  String get wasteCompostTitle => 'Sim, faço compostagem';

  @override
  String get wasteCompostSub => 'Reduz emissões de metano do aterro';

  @override
  String get waterModuleTitle => 'Água';

  @override
  String get waterModuleWeight => '~3% da sua pegada';

  @override
  String get waterQ1 => 'Quantos minutos dura seu banho médio?';

  @override
  String waterMinutesHint(int n) {
    return '$n minutos';
  }

  @override
  String get waterQ2 => 'Em que temperatura você geralmente toma banho?';

  @override
  String get waterQ3 => 'Você rega jardim ou áreas verdes em casa?';

  @override
  String get waterGardenTitle => 'Sim, tenho jardim ou rego plantas';

  @override
  String get tempCold => 'Frio';

  @override
  String get tempColdSub => 'Sem aquecedor';

  @override
  String get tempWarm => 'Morno';

  @override
  String get tempWarmSub => 'Aquecedor moderado';

  @override
  String get tempHot => 'Quente';

  @override
  String get tempHotSub => 'Aquecedor máximo';

  @override
  String get cancel => 'Cancelar';

  @override
  String greetingWithName(String name) {
    return 'Olá, $name 👋';
  }

  @override
  String get greetingEmpty => 'Olá 👋';

  @override
  String get addYourName => 'Adicione seu nome';

  @override
  String get nameDialogTitle => 'Qual é o seu nome?';

  @override
  String get nameDialogHint => 'Seu nome';

  @override
  String get nameOnCard => 'nome no cartão';

  @override
  String get historyTitle => 'Evolução da sua pegada';

  @override
  String historyMeasurements(int n) {
    return '$n medições';
  }

  @override
  String get historyEmptyTitle => 'Sem histórico ainda';

  @override
  String get historyEmptySub =>
      'Atualize seus módulos em dias diferentes para acompanhar como sua pegada evolui.';

  @override
  String get historyOneMeasurement => 'Primeira medição registrada! 🎉';

  @override
  String get historyOneSub =>
      'Volte amanhã e atualize um módulo para ver sua evolução.';

  @override
  String historyImproved(String pct) {
    return '↓ $pct% desde sua primeira medição';
  }

  @override
  String historyWorsened(String pct) {
    return '↑ $pct% desde sua primeira medição';
  }

  @override
  String get offsetTitle => 'Como compensar sua pegada?';

  @override
  String get offsetSubtitle =>
      'Enquanto você reduz, pode neutralizar o CO₂ restante';

  @override
  String offsetTreesValue(int n) {
    return '$n árvores';
  }

  @override
  String get offsetTreesLabel => 'para absorver sua pegada anual';

  @override
  String offsetCostValue(int usd) {
    return '~$usd USD/ano';
  }

  @override
  String offsetCostMonthly(int usd) {
    return '~$usd USD/mês';
  }

  @override
  String get offsetCostLabel => 'em créditos de carbono certificados';

  @override
  String get offsetReduceFirst => 'Reduza primeiro, compense depois';

  @override
  String get offsetReduceFirstDesc =>
      'Os créditos de carbono são um complemento, não um substituto para reduzir sua pegada.';

  @override
  String get offsetPlatformsTitle => 'Plataformas certificadas';

  @override
  String get offsetDisclaimer =>
      '* Estimativa baseada no mercado voluntário de carbono (~\$20/t CO₂) e absorção de árvore madura (~21 kg CO₂/ano).';

  @override
  String get resultsTitle => 'Diagnóstico concluído!';

  @override
  String get resultsSub =>
      'Você completou os 6 módulos da sua pegada de carbono';

  @override
  String get resultsYourFootprint => 'Sua pegada de carbono anual';

  @override
  String get resultsCompareTitle => 'Como você se compara?';

  @override
  String get resultsYou => 'Você';

  @override
  String get resultsParis => 'Meta Paris';

  @override
  String get resultsColombia => 'Colômbia';

  @override
  String get resultsWorld => 'Mundo';

  @override
  String get resultsTopSources => 'Principais fontes de emissão';

  @override
  String get resultsAchievements => 'Suas conquistas';

  @override
  String resultsEcoPoints(int points) {
    return '$points pontos EcoScore';
  }

  @override
  String get resultsBadgesUnlocked => 'conquistas desbloqueadas';

  @override
  String get resultsViewDashboard => 'Ver Dashboard completo';

  @override
  String get resultsViewPlan => 'Criar meu Plano de Ação';

  @override
  String get resultsViewAgain => 'Ver meus resultados 🏆';

  @override
  String get exportResult => 'Exportar imagem';

  @override
  String get downloadImage => 'Baixar imagem';

  @override
  String get tabHome => 'Início';

  @override
  String get homeWelcomeTitle => 'Conheça sua pegada de carbono';

  @override
  String get homeWelcomeSub =>
      'Complete os 6 módulos do diagnóstico e descubra como você pode reduzir seu impacto no planeta.';

  @override
  String get homeStartTest => 'Começar meu diagnóstico';

  @override
  String get homeUpdateTest => 'Atualizar meu teste';

  @override
  String get homeViewFullFootprint => 'Ver análise completa';

  @override
  String homeModulesStatus(int completed) {
    return '$completed de 6 módulos concluídos';
  }
}
