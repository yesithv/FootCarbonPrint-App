import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/carbon_footprint.dart';
import '../../../providers/footprint_provider.dart';
import '../../../widgets/module_scaffold.dart';
import '../../../widgets/question_card.dart';

class FoodModule extends StatefulWidget {
  const FoodModule({super.key});

  @override
  State<FoodModule> createState() => _FoodModuleState();
}

class _FoodModuleState extends State<FoodModule> {
  String _diet = 'omnivore';
  double _beefServings = 3;
  bool _localFood = false;
  double _foodWaste = 0.2;

  final _diets = [
    _DietOption('vegan', 'Vegano', '🌱', 'Solo plantas'),
    _DietOption('vegetarian', 'Vegetariano', '🥦', 'Sin carne'),
    _DietOption('flexitarian', 'Flexitariano', '🥗', 'Poca carne'),
    _DietOption('omnivore', 'Omnívoro', '🍽️', 'Carne regular'),
    _DietOption('carnivore', 'Alta en carne', '🥩', 'Carne a diario'),
  ];

  final _wasteLabels = ['Casi nada', 'Algo', 'Bastante', 'Mucho'];

  void _save() {
    context.read<FootprintProvider>().updateFood(FoodData(
          diet: _diet,
          beefServingsPerWeek: _beefServings.round(),
          localFood: _localFood,
          foodWaste: _foodWaste,
        ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ModuleScaffold(
      title: 'Alimentación',
      icon: Icons.restaurant_rounded,
      color: AppColors.food,
      weight: '25–30% de tu huella',
      onSave: _save,
      children: [
        QuestionCard(
          question: '¿Cómo describirías tu dieta?',
          child: Column(
            children: _diets
                .map((d) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () => setState(() => _diet = d.id),
                        borderRadius: BorderRadius.circular(12),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: _diet == d.id
                                ? AppColors.food.withAlpha(20)
                                : Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _diet == d.id
                                  ? AppColors.food
                                  : Colors.grey.shade200,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(d.emoji, style: const TextStyle(fontSize: 24)),
                              const SizedBox(width: 14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(d.label,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: _diet == d.id
                                              ? AppColors.food
                                              : AppColors.textPrimary)),
                                  Text(d.sub,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textSecondary)),
                                ],
                              ),
                              const Spacer(),
                              if (_diet == d.id)
                                Icon(Icons.check_circle_rounded,
                                    color: AppColors.food),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        QuestionCard(
          question: '¿Cuántas veces comes carne de res por semana?',
          hint: '${_beefServings.round()} veces',
          child: Slider(
            value: _beefServings,
            min: 0,
            max: 14,
            divisions: 14,
            onChanged: (v) => setState(() => _beefServings = v),
          ),
        ),
        QuestionCard(
          question: '¿Cuánto desperdicias de comida?',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (i) {
              final val = i * 0.33;
              final selected = (_foodWaste * 3).round() == i;
              return GestureDetector(
                onTap: () => setState(() => _foodWaste = val),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.food
                            : AppColors.food.withAlpha(15),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        ['🌿', '🍽️', '🗑️', '😱'][i],
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _wasteLabels[i],
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: selected
                            ? FontWeight.w700
                            : FontWeight.w400,
                        color: selected
                            ? AppColors.food
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        QuestionCard(
          question: '¿Consumes alimentos locales y de temporada?',
          child: SwitchListTile(
            title: const Text('Principalmente local y de temporada'),
            subtitle: const Text('Reduce hasta 0.1 tCO₂/año'),
            value: _localFood,
            onChanged: (v) => setState(() => _localFood = v),
            activeColor: AppColors.food,
          ),
        ),
        _Co2Preview(
          value: FoodData(
            diet: _diet,
            beefServingsPerWeek: _beefServings.round(),
            localFood: _localFood,
            foodWaste: _foodWaste,
          ).annualCO2,
          color: AppColors.food,
        ),
      ],
    );
  }
}

class _DietOption {
  final String id;
  final String label;
  final String emoji;
  final String sub;
  const _DietOption(this.id, this.label, this.emoji, this.sub);
}

class _Co2Preview extends StatelessWidget {
  final double value;
  final Color color;
  const _Co2Preview({required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Row(
        children: [
          Icon(Icons.co2_rounded, color: color, size: 32),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${value.toStringAsFixed(2)} t CO₂/año',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w800, color: color),
              ),
              const Text('Estimado de este módulo',
                  style: TextStyle(
                      fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}
