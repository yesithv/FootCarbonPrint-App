import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/carbon_footprint.dart';
import '../../../providers/footprint_provider.dart';
import '../../../widgets/module_scaffold.dart';
import '../../../widgets/question_card.dart';

class ShoppingModule extends StatefulWidget {
  const ShoppingModule({super.key});

  @override
  State<ShoppingModule> createState() => _ShoppingModuleState();
}

class _ShoppingModuleState extends State<ShoppingModule> {
  double _clothingPerMonth = 2;
  double _electronicsPerYear = 1;
  double _packagesPerMonth = 4;
  bool _buysSecondHand = false;

  void _save() {
    context.read<FootprintProvider>().updateShopping(ShoppingData(
          clothingItemsPerMonth: _clothingPerMonth.round(),
          electronicsPerYear: _electronicsPerYear.round(),
          onlinePackagesPerMonth: _packagesPerMonth.round(),
          buysSecondHand: _buysSecondHand,
        ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ModuleScaffold(
      title: l10n.shoppingModuleTitle,
      icon: Icons.shopping_bag_rounded,
      color: AppColors.shopping,
      weight: l10n.shoppingModuleWeight,
      onSave: _save,
      children: [
        QuestionCard(
          question: l10n.shoppingQ1,
          hint: l10n.shoppingClothingHint(_clothingPerMonth.round()),
          child: Slider(
            value: _clothingPerMonth,
            min: 0,
            max: 20,
            divisions: 20,
            activeColor: AppColors.shopping,
            onChanged: (v) => setState(() => _clothingPerMonth = v),
          ),
        ),
        QuestionCard(
          question: l10n.shoppingQ2,
          hint: l10n.shoppingElectronicsHint(_electronicsPerYear.round()),
          child: Slider(
            value: _electronicsPerYear,
            min: 0,
            max: 10,
            divisions: 10,
            activeColor: AppColors.shopping,
            onChanged: (v) => setState(() => _electronicsPerYear = v),
          ),
        ),
        QuestionCard(
          question: l10n.shoppingQ3,
          hint: l10n.shoppingPackagesHint(_packagesPerMonth.round()),
          child: Slider(
            value: _packagesPerMonth,
            min: 0,
            max: 30,
            divisions: 30,
            activeColor: AppColors.shopping,
            onChanged: (v) => setState(() => _packagesPerMonth = v),
          ),
        ),
        QuestionCard(
          question: l10n.shoppingQ4,
          child: SwitchListTile(
            title: Text(l10n.shoppingSecondHandTitle),
            subtitle: Text(l10n.shoppingSecondHandSub),
            value: _buysSecondHand,
            onChanged: (v) => setState(() => _buysSecondHand = v),
            activeColor: AppColors.shopping,
          ),
        ),
        _Co2Preview(
          value: ShoppingData(
            clothingItemsPerMonth: _clothingPerMonth.round(),
            electronicsPerYear: _electronicsPerYear.round(),
            onlinePackagesPerMonth: _packagesPerMonth.round(),
            buysSecondHand: _buysSecondHand,
          ).annualCO2,
          color: AppColors.shopping,
        ),
      ],
    );
  }
}

class _Co2Preview extends StatelessWidget {
  final double value;
  final Color color;
  const _Co2Preview({required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
              Text(l10n.moduleEstimate,
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}
