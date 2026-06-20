import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/carbon_footprint.dart';
import '../../../providers/footprint_provider.dart';
import '../../../widgets/module_scaffold.dart';
import '../../../widgets/question_card.dart';

class HomeModule extends StatefulWidget {
  const HomeModule({super.key});

  @override
  State<HomeModule> createState() => _HomeModuleState();
}

class _HomeModuleState extends State<HomeModule> {
  String _energySource = 'grid';
  double _monthlyKwh = 200;
  int _householdMembers = 3;
  bool _hasAC = false;
  double _acHours = 4;

  final _energySources = [
    _EnergyOption('grid', 'Red eléctrica', Icons.electrical_services_rounded),
    _EnergyOption('solar', 'Solar', Icons.wb_sunny_rounded),
    _EnergyOption('gas', 'Gas natural', Icons.local_fire_department_rounded),
    _EnergyOption('mixed', 'Mixto', Icons.device_hub_rounded),
  ];

  void _save() {
    context.read<FootprintProvider>().updateHome(HomeData(
          energySource: _energySource,
          monthlyKwh: _monthlyKwh,
          householdMembers: _householdMembers,
          hasAC: _hasAC,
          acHoursPerDay: _hasAC ? _acHours : 0,
        ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ModuleScaffold(
      title: 'Hogar y Energía',
      icon: Icons.home_rounded,
      color: AppColors.home,
      weight: '20–25% de tu huella',
      onSave: _save,
      children: [
        QuestionCard(
          question: '¿Cuántas personas viven en tu hogar?',
          hint: '$_householdMembers persona${_householdMembers > 1 ? 's' : ''}',
          child: Slider(
            value: _householdMembers.toDouble(),
            min: 1,
            max: 10,
            divisions: 9,
            onChanged: (v) =>
                setState(() => _householdMembers = v.round()),
          ),
        ),
        QuestionCard(
          question: '¿Cuál es tu fuente de energía principal?',
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _energySources
                .map((e) => ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(e.icon,
                              size: 16,
                              color: _energySource == e.id
                                  ? Colors.white
                                  : AppColors.home),
                          const SizedBox(width: 6),
                          Text(e.label),
                        ],
                      ),
                      selected: _energySource == e.id,
                      selectedColor: AppColors.home,
                      labelStyle: TextStyle(
                        color: _energySource == e.id
                            ? Colors.white
                            : AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      onSelected: (_) =>
                          setState(() => _energySource = e.id),
                    ))
                .toList(),
          ),
        ),
        QuestionCard(
          question: '¿Cuántos kWh consumes al mes?',
          hint: '${_monthlyKwh.round()} kWh',
          child: Column(
            children: [
              Slider(
                value: _monthlyKwh,
                min: 50,
                max: 800,
                divisions: 30,
                onChanged: (v) => setState(() => _monthlyKwh = v),
              ),
              const Text(
                'Promedio hogar Colombia: 170–250 kWh/mes',
                style: TextStyle(fontSize: 11, color: AppColors.textHint),
              ),
            ],
          ),
        ),
        QuestionCard(
          question: '¿Tienes aire acondicionado o calefacción?',
          child: Column(
            children: [
              SwitchListTile(
                title: const Text('Sí, uso AC / calefacción'),
                value: _hasAC,
                onChanged: (v) => setState(() => _hasAC = v),
                activeColor: AppColors.home,
              ),
              if (_hasAC) ...[
                const SizedBox(height: 8),
                Text(
                  '${_acHours.round()} horas/día',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.home),
                ),
                Slider(
                  value: _acHours,
                  min: 1,
                  max: 24,
                  divisions: 23,
                  onChanged: (v) => setState(() => _acHours = v),
                ),
              ],
            ],
          ),
        ),
        _Co2Preview(
          value: HomeData(
            energySource: _energySource,
            monthlyKwh: _monthlyKwh,
            householdMembers: _householdMembers,
            hasAC: _hasAC,
            acHoursPerDay: _hasAC ? _acHours : 0,
          ).annualCO2,
          color: AppColors.home,
        ),
      ],
    );
  }
}

class _EnergyOption {
  final String id;
  final String label;
  final IconData icon;
  const _EnergyOption(this.id, this.label, this.icon);
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
