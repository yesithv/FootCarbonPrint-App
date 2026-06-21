import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/carbon_footprint.dart';
import '../../../providers/footprint_provider.dart';
import '../../../widgets/module_scaffold.dart';
import '../../../widgets/question_card.dart';

class WasteModule extends StatefulWidget {
  const WasteModule({super.key});

  @override
  State<WasteModule> createState() => _WasteModuleState();
}

class _WasteModuleState extends State<WasteModule> {
  bool _separates = false;
  bool _composts = false;
  double _bagsPerWeek = 2;

  void _save() {
    context.read<FootprintProvider>().updateWaste(WasteData(
          separatesWaste: _separates,
          composts: _composts,
          wasteBagsPerWeek: _bagsPerWeek.round(),
        ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ModuleScaffold(
      title: l10n.wasteModuleTitle,
      icon: Icons.recycling_rounded,
      color: AppColors.waste,
      weight: l10n.wasteModuleWeight,
      onSave: _save,
      children: [
        QuestionCard(
          question: l10n.wasteQ1,
          hint: l10n.wasteBagsHint(_bagsPerWeek.round(), _bagsPerWeek >= 2 ? 's' : ''),
          child: Slider(
            value: _bagsPerWeek,
            min: 0,
            max: 10,
            divisions: 10,
            activeColor: AppColors.waste,
            onChanged: (v) => setState(() => _bagsPerWeek = v),
          ),
        ),
        QuestionCard(
          question: l10n.wasteQ2,
          child: SwitchListTile(
            title: Text(l10n.wasteSeparateTitle),
            subtitle: Text(l10n.wasteSeparateSub),
            value: _separates,
            onChanged: (v) => setState(() => _separates = v),
            activeColor: AppColors.waste,
          ),
        ),
        QuestionCard(
          question: l10n.wasteQ3,
          child: SwitchListTile(
            title: Text(l10n.wasteCompostTitle),
            subtitle: Text(l10n.wasteCompostSub),
            value: _composts,
            onChanged: (v) => setState(() => _composts = v),
            activeColor: AppColors.waste,
          ),
        ),
        _Co2Preview(
          value: WasteData(
            separatesWaste: _separates,
            composts: _composts,
            wasteBagsPerWeek: _bagsPerWeek.round(),
          ).annualCO2,
          color: AppColors.waste,
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
