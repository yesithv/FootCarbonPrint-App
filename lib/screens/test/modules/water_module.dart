import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/carbon_footprint.dart';
import '../../../providers/footprint_provider.dart';
import '../../../widgets/module_scaffold.dart';
import '../../../widgets/question_card.dart';

class WaterModule extends StatefulWidget {
  const WaterModule({super.key});

  @override
  State<WaterModule> createState() => _WaterModuleState();
}

class _WaterModuleState extends State<WaterModule> {
  double _showerMinutes = 8;
  String _showerTemp = 'warm';
  bool _hasGarden = false;

  final _temps = [
    _TempOption('cold', 'Fría', '🧊', 'Sin calentador'),
    _TempOption('warm', 'Tibia', '🚿', 'Calentador moderado'),
    _TempOption('hot', 'Caliente', '🔥', 'Calentador máximo'),
  ];

  void _save() {
    context.read<FootprintProvider>().updateWater(WaterData(
          showerMinutes: _showerMinutes,
          showerTemp: _showerTemp,
          hasGarden: _hasGarden,
        ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ModuleScaffold(
      title: 'Agua',
      icon: Icons.water_drop_rounded,
      color: AppColors.water,
      weight: '~3% de tu huella',
      onSave: _save,
      children: [
        QuestionCard(
          question: '¿Cuántos minutos dura tu ducha promedio?',
          hint: '${_showerMinutes.round()} minutos',
          child: Slider(
            value: _showerMinutes,
            min: 2,
            max: 30,
            divisions: 28,
            activeColor: AppColors.water,
            onChanged: (v) => setState(() => _showerMinutes = v),
          ),
        ),
        QuestionCard(
          question: '¿A qué temperatura te duchas normalmente?',
          child: Row(
            children: _temps
                .map((t) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _showerTemp = t.id),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 8),
                            decoration: BoxDecoration(
                              color: _showerTemp == t.id
                                  ? AppColors.water.withAlpha(20)
                                  : Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: _showerTemp == t.id
                                    ? AppColors.water
                                    : Colors.grey.shade200,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(t.emoji,
                                    style: const TextStyle(fontSize: 24)),
                                const SizedBox(height: 6),
                                Text(
                                  t.label,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: _showerTemp == t.id
                                        ? AppColors.water
                                        : AppColors.textPrimary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  t.sub,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColors.textHint),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        QuestionCard(
          question: '¿Riegas jardín o zonas verdes en casa?',
          child: SwitchListTile(
            title: const Text('Sí, tengo jardín o riego plantas'),
            value: _hasGarden,
            onChanged: (v) => setState(() => _hasGarden = v),
            activeColor: AppColors.water,
          ),
        ),
        _Co2Preview(
          value: WaterData(
            showerMinutes: _showerMinutes,
            showerTemp: _showerTemp,
            hasGarden: _hasGarden,
          ).annualCO2,
          color: AppColors.water,
        ),
      ],
    );
  }
}

class _TempOption {
  final String id;
  final String label;
  final String emoji;
  final String sub;
  const _TempOption(this.id, this.label, this.emoji, this.sub);
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
