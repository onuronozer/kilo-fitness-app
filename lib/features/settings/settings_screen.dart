import 'package:flutter/material.dart';
import '../../services/app_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.state});
  final AppState state;
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final Map<String, TextEditingController> controls;
  @override
  void initState() {
    super.initState();
    final s = widget.state.settings;
    controls = {
      'Antrenman günü kalori': TextEditingController(
        text: s.workoutCalories.toStringAsFixed(0),
      ),
      'Dinlenme günü kalori': TextEditingController(
        text: s.restCalories.toStringAsFixed(0),
      ),
      'Protein hedefi (g)': TextEditingController(
        text: s.protein.toStringAsFixed(0),
      ),
      'Su hedefi (L)': TextEditingController(text: s.water.toStringAsFixed(1)),
      'Hedef kilo (kg)': TextEditingController(
        text: s.targetWeight.toStringAsFixed(1),
      ),
      'Eğimli yürüyüş (dk)': TextEditingController(
        text: s.inclineMinutes.toStringAsFixed(0),
      ),
    };
  }

  @override
  void dispose() {
    for (final x in controls.values) {
      x.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      Text('Ayarlar', style: Theme.of(context).textTheme.headlineMedium),
      const Text('Hedeflerin bu cihazda saklanır.'),
      const SizedBox(height: 12),
      ...controls.entries.map(
        (e) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextField(
            controller: e.value,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: e.key),
          ),
        ),
      ),
      FilledButton.icon(
        onPressed: _save,
        icon: const Icon(Icons.save),
        label: const Text('Ayarları kaydet'),
      ),
      const SizedBox(height: 12),
      const Card(
        child: ListTile(
          leading: Icon(Icons.lock_outline),
          title: Text('Gizlilik'),
          subtitle: Text(
            'Kilo, ölçüm, öğün ve antrenman kayıtları yalnızca bu cihazda tutulur; hiçbir sunucuya gönderilmez.',
          ),
        ),
      ),
    ],
  );
  void _save() {
    double v(String k) =>
        double.tryParse(controls[k]!.text.replaceAll(',', '.')) ?? 0;
    final s = widget.state.settings;
    s.workoutCalories = v('Antrenman günü kalori');
    s.restCalories = v('Dinlenme günü kalori');
    s.protein = v('Protein hedefi (g)');
    s.water = v('Su hedefi (L)');
    s.targetWeight = v('Hedef kilo (kg)');
    s.inclineMinutes = v('Eğimli yürüyüş (dk)');
    widget.state.saveSettings();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Ayarlar kaydedildi')));
  }
}
