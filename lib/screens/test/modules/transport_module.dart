import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  final _vehicles = [
    _VehicleOption('gasoline', 'Gasolina', Icons.local_gas_station_rounded),
    _VehicleOption('diesel', 'Diésel', Icons.local_gas_station_rounded),
    _VehicleOption('hybrid', 'Híbrido', Icons.electric_car_rounded),
    _VehicleOption('electric', 'Eléctrico', Icons.bolt_rounded),
    _VehicleOption('motorcycle', 'Moto', Icons.two_wheeler_rounded),
    _VehicleOption('bus', 'Bus/Metro', Icons.directions_bus_rounded),
    _VehicleOption('bicycle', 'Bicicleta', Icons.pedal_bike_rounded),
    _VehicleOption('walking', 'A pie', Icons.directions_walk_rounded),
  ];

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
    return ModuleScaffold(
      title: 'Transporte',
      icon: Icons.directions_car_rounded,
      color: AppColors.transport,
      weight: '28–35% de tu huella',
      onSave: _save,
      children: [
        QuestionCard(
          question: '¿Cuál es tu medio de transporte principal?',
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _vehicles
                .map((v) => ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(v.icon,
                              size: 16,
                              color: _vehicle == v.id
                                  ? Colors.white
                                  : AppColors.transport),
                          const SizedBox(width: 6),
                          Text(v.label),
                        ],
                      ),
                      selected: _vehicle == v.id,
                      selectedColor: AppColors.transport,
                      labelStyle: TextStyle(
                        color: _vehicle == v.id
                            ? Colors.white
                            : AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      onSelected: (_) => setState(() => _vehicle = v.id),
                    ))
                .toList(),
          ),
        ),
        QuestionCard(
          question: '¿Cuántos km recorres por semana?',
          hint: '${_weeklyKm.round()} km/semana',
          child: Slider(
            value: _weeklyKm,
            min: 0,
            max: 500,
            divisions: 50,
            onChanged: (v) => setState(() => _weeklyKm = v),
          ),
        ),
        QuestionCard(
          question: '¿Cuántos vuelos haces al año?',
          child: Column(
            children: [
              _FlightCounter(
                label: 'Cortos (< 3h)',
                value: _shortFlights,
                onChanged: (v) => setState(() => _shortFlights = v),
              ),
              const SizedBox(height: 12),
              _FlightCounter(
                label: 'Medios (3–6h)',
                value: _mediumFlights,
                onChanged: (v) => setState(() => _mediumFlights = v),
              ),
              const SizedBox(height: 12),
              _FlightCounter(
                label: 'Largos (> 6h)',
                value: _longFlights,
                onChanged: (v) => setState(() => _longFlights = v),
              ),
            ],
          ),
        ),
        _Co2Preview(
          value: TransportData(
            vehicle: _vehicle,
            weeklyKm: _weeklyKm,
            shortFlights: _shortFlights,
            mediumFlights: _mediumFlights,
            longFlights: _longFlights,
          ).annualCO2,
          color: AppColors.transport,
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
              style: const TextStyle(
                  fontSize: 14, color: AppColors.textSecondary)),
        ),
        IconButton(
          onPressed: value > 0 ? () => onChanged(value - 1) : null,
          icon: const Icon(Icons.remove_circle_outline_rounded),
          color: AppColors.transport,
        ),
        SizedBox(
          width: 32,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary),
          ),
        ),
        IconButton(
          onPressed: () => onChanged(value + 1),
          icon: const Icon(Icons.add_circle_outline_rounded),
          color: AppColors.transport,
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
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
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
