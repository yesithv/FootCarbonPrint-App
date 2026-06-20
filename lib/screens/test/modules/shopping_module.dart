import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return ModuleScaffold(
      title: 'Consumo',
      icon: Icons.shopping_bag_rounded,
      color: AppColors.shopping,
      weight: '10–15% de tu huella',
      onSave: _save,
      children: [
        QuestionCard(
          question: '¿Cuántas prendas de ropa compras al mes?',
          hint: '${_clothingPerMonth.round()} prendas',
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
          question: '¿Dispositivos electrónicos nuevos por año?',
          hint: '${_electronicsPerYear.round()} dispositivos',
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
          question: '¿Cuántos paquetes de e-commerce recibes al mes?',
          hint: '${_packagesPerMonth.round()} paquetes',
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
          question: '¿Compras ropa o artículos de segunda mano?',
          child: SwitchListTile(
            title: const Text('Sí, compro segunda mano frecuentemente'),
            subtitle: const Text('Reduce tu huella de consumo hasta 10%'),
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
