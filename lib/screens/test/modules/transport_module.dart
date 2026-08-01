import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/carbon_footprint.dart';
import '../../../providers/footprint_provider.dart';
import '../../../widgets/module_scaffold.dart';
import '../../../widgets/question_card.dart';

class TransportModule extends StatefulWidget {
  const TransportModule({super.key});

  @override
  State<TransportModule> createState() => _TransportModuleState();
}

class _TransportModuleState extends State<TransportModule> {
  String _vehicle = 'bus';
  double _weeklyKm = 50;
  int _shortFlights = 0;
  int _mediumFlights = 0;
  int _longFlights = 0;

  void _save() {
    context.read<FootprintProvider>().updateTransport(TransportData(
          vehicle: _vehicle,
          weeklyKm: _weeklyKm,
          shortFlights: _shortFlights,
          mediumFlights: _mediumFlights,
          longFlights: _longFlights,
        ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final vehicles = [
      _VehicleOption('gasoline', l10n.vehicleGasoline, Icons.local_gas_station_rounded),
      _VehicleOption('diesel', l10n.vehicleDiesel, Icons.local_gas_station_rounded),
      _VehicleOption('hybrid', l10n.vehicleHybrid, Icons.electric_car_rounded),
      _VehicleOption('electric', l10n.vehicleElectric, Icons.bolt_rounded),
      _VehicleOption('motorcycle', l10n.vehicleMotorcycle, Icons.two_wheeler_rounded),
      _VehicleOption('bus', l10n.vehicleBus, Icons.directions_bus_rounded),
      _VehicleOption('bicycle', l10n.vehicleBicycle, Icons.pedal_bike_rounded),
      _VehicleOption('walking', l10n.vehicleWalking, Icons.directions_walk_rounded),
    ];

    final liveEstimate = TransportData(
      vehicle: _vehicle,
      weeklyKm: _weeklyKm,
      shortFlights: _shortFlights,
      mediumFlights: _mediumFlights,
      longFlights: _longFlights,
    ).annualCO2;

    return ModuleScaffold(
      title: l10n.transportModuleTitle,
      icon: Icons.directions_car_rounded,
      color: context.palette.transport,
      weight: l10n.transportModuleWeight,
      onSave: _save,
      liveEstimate: liveEstimate,
      children: [
        QuestionCard(
          question: l10n.transportQ1,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: vehicles
                .map((v) => ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(v.icon,
                              size: 16,
                              color: _vehicle == v.id
                                  ? context.palette.onCategory
                                  : context.palette.transport),
                          const SizedBox(width: 6),
                          Text(v.label),
                        ],
                      ),
                      selected: _vehicle == v.id,
                      selectedColor: context.palette.transport,
                      labelStyle: TextStyle(
                        color: _vehicle == v.id
                            ? context.palette.onCategory
                            : context.palette.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      onSelected: (_) => setState(() => _vehicle = v.id),
                    ))
                .toList(),
          ),
        ),
        QuestionCard(
          question: l10n.transportQ2,
          hint: l10n.transportKmHint(_weeklyKm.round()),
          child: Slider(
            value: _weeklyKm,
            min: 0,
            max: 500,
            divisions: 50,
            onChanged: (v) => setState(() => _weeklyKm = v),
          ),
        ),
        QuestionCard(
          question: l10n.transportQ3,
          child: Column(
            children: [
              _FlightCounter(
                label: l10n.flightShort,
                value: _shortFlights,
                onChanged: (v) => setState(() => _shortFlights = v),
              ),
              const SizedBox(height: 12),
              _FlightCounter(
                label: l10n.flightMedium,
                value: _mediumFlights,
                onChanged: (v) => setState(() => _mediumFlights = v),
              ),
              const SizedBox(height: 12),
              _FlightCounter(
                label: l10n.flightLong,
                value: _longFlights,
                onChanged: (v) => setState(() => _longFlights = v),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _VehicleOption {
  final String id;
  final String label;
  final IconData icon;
  const _VehicleOption(this.id, this.label, this.icon);
}

class _FlightCounter extends StatelessWidget {
  final String label;
  final int value;
  final ValueChanged<int> onChanged;
  const _FlightCounter(
      {required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label,
              style: TextStyle(
                  fontSize: 14, color: context.palette.textSecondary)),
        ),
        IconButton(
          onPressed: value > 0 ? () => onChanged(value - 1) : null,
          icon: const Icon(Icons.remove_circle_outline_rounded),
          color: context.palette.transport,
        ),
        SizedBox(
          width: 32,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: context.palette.textPrimary),
          ),
        ),
        IconButton(
          onPressed: () => onChanged(value + 1),
          icon: const Icon(Icons.add_circle_outline_rounded),
          color: context.palette.transport,
        ),
      ],
    );
  }
}

