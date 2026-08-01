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
      color: context.palette.waste,
      weight: l10n.wasteModuleWeight,
      onSave: _save,
      liveEstimate: WasteData(
        separatesWaste: _separates,
        composts: _composts,
        wasteBagsPerWeek: _bagsPerWeek.round(),
      ).annualCO2,
      children: [
        QuestionCard(
          question: l10n.wasteQ1,
          hint: l10n.wasteBagsHint(_bagsPerWeek.round(), _bagsPerWeek >= 2 ? 's' : ''),
          child: Slider(
            value: _bagsPerWeek,
            min: 0,
            max: 10,
            divisions: 10,
            activeColor: context.palette.waste,
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
            activeColor: context.palette.waste,
          ),
        ),
        QuestionCard(
          question: l10n.wasteQ3,
          child: SwitchListTile(
            title: Text(l10n.wasteCompostTitle),
            subtitle: Text(l10n.wasteCompostSub),
            value: _composts,
            onChanged: (v) => setState(() => _composts = v),
            activeColor: context.palette.waste,
          ),
        ),
      ],
    );
  }
}
