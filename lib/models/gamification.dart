import 'package:flutter/material.dart';
import '../providers/footprint_provider.dart';

class AppBadge {
  final String id;
  final String emoji;
  final String name;
  final String description;

  const AppBadge({
    required this.id,
    required this.emoji,
    required this.name,
    required this.description,
  });
}

class EcoLevel {
  final String name;
  final String emoji;
  final Color color;
  final int minPoints;
  final int maxPoints;

  const EcoLevel({
    required this.name,
    required this.emoji,
    required this.color,
    required this.minPoints,
    required this.maxPoints,
  });
}

class GamificationData {
  static const levels = [
    EcoLevel(
      name: 'Principiante',
      emoji: '🌱',
      color: Color(0xFF78909C),
      minPoints: 0,
      maxPoints: 49,
    ),
    EcoLevel(
      name: 'Aprendiz',
      emoji: '🔎',
      color: Color(0xFF42A5F5),
      minPoints: 50,
      maxPoints: 149,
    ),
    EcoLevel(
      name: 'Consciente',
      emoji: '💚',
      color: Color(0xFF66BB6A),
      minPoints: 150,
      maxPoints: 299,
    ),
    EcoLevel(
      name: 'Activista',
      emoji: '✊',
      color: Color(0xFFAB47BC),
      minPoints: 300,
      maxPoints: 449,
    ),
    EcoLevel(
      name: 'Eco-Campeón',
      emoji: '🏆',
      color: Color(0xFFFFA726),
      minPoints: 450,
      maxPoints: 9999,
    ),
  ];

  static const allBadges = [
    AppBadge(
      id: 'first_step',
      emoji: '🌱',
      name: 'Primer Paso',
      description: 'Completa tu primer módulo del test',
    ),
    AppBadge(
      id: 'explorer',
      emoji: '🔍',
      name: 'Explorador',
      description: 'Completa 3 módulos del test',
    ),
    AppBadge(
      id: 'completionist',
      emoji: '🌍',
      name: 'Completista',
      description: 'Completa los 6 módulos del test',
    ),
    AppBadge(
      id: 'educated',
      emoji: '📚',
      name: 'Educado',
      description: 'Termina la guía de aprendizaje',
    ),
    AppBadge(
      id: 'conscious',
      emoji: '💚',
      name: 'Consciente',
      description: 'Logra una huella menor a 3 toneladas',
    ),
    AppBadge(
      id: 'champion',
      emoji: '🏆',
      name: 'Huella Ligera',
      description: 'Logra una huella menor a 1.5 toneladas',
    ),
    AppBadge(
      id: 'committed',
      emoji: '✊',
      name: 'Comprometido',
      description: 'Comprométete con al menos 1 acción',
    ),
    AppBadge(
      id: 'activist',
      emoji: '⚡',
      name: 'Activista',
      description: 'Comprométete con 5 acciones del plan',
    ),
  ];

  static EcoLevel levelForPoints(int points) {
    for (final level in levels.reversed) {
      if (points >= level.minPoints) return level;
    }
    return levels.first;
  }

  static EcoLevel? nextLevel(int points) {
    for (int i = 0; i < levels.length - 1; i++) {
      if (points <= levels[i].maxPoints) return levels[i + 1];
    }
    return null;
  }

  static double levelProgress(int points) {
    final current = levelForPoints(points);
    if (current.maxPoints == 9999) return 1.0;
    final range = current.maxPoints - current.minPoints + 1;
    final progress = points - current.minPoints;
    return (progress / range).clamp(0.0, 1.0);
  }

  static Set<String> computeEarnedBadgeIds(FootprintProvider p) {
    final earned = <String>{};
    final count = p.completedCount;
    if (count >= 1) earned.add('first_step');
    if (count >= 3) earned.add('explorer');
    if (count == 6) earned.add('completionist');
    if (p.footprint.learnGuideCompleted) earned.add('educated');
    if (count > 0) {
      final t = p.footprint.totalCO2;
      if (t < 3.0) earned.add('conscious');
      if (t < 1.5) earned.add('champion');
    }
    if (p.committedActionsCount >= 1) earned.add('committed');
    if (p.committedActionsCount >= 5) earned.add('activist');
    return earned;
  }

  static int computePoints(FootprintProvider p) {
    int pts = 0;
    pts += p.completedCount * 20;
    if (p.completedCount == 6) pts += 50;
    if (p.footprint.learnGuideCompleted) pts += 30;
    pts += p.committedActionsCount * 15;
    pts += p.completedChallengesCount * 25;
    if (p.completedCount > 0) {
      final t = p.footprint.totalCO2;
      if (t < 1.5) {
        pts += 100;
      } else if (t < 3.0) {
        pts += 50;
      }
    }
    return pts;
  }
}
