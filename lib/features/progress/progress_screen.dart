import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/logic.dart';
import '../../models/models.dart';
import '../../services/app_state.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key, required this.state});
  final AppState state;
  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int days = 7;
  final wc = TextEditingController();
  @override
  void dispose() {
    wc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final visible = days == 0
        ? widget.state.weights
        : widget.state.weights
              .where((e) => e.date.isAfter(now.subtract(Duration(days: days))))
              .toList();
    return ListView(
      key: const Key('progress-screen'),
      padding: const EdgeInsets.all(16),
      children: [
        Text('Gelişim', style: Theme.of(context).textTheme.headlineMedium),
        SegmentedButton<int>(
          segments: const [
            ButtonSegment(value: 7, label: Text('7 gün')),
            ButtonSegment(value: 30, label: Text('30 gün')),
            ButtonSegment(value: 0, label: Text('Tümü')),
          ],
          selected: {days},
          onSelectionChanged: (s) => setState(() => days = s.first),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kilo', style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 180,
                  child: visible.isEmpty
                      ? const Center(
                          child: Text(
                            'İlk kaydını eklediğinde grafik burada görünecek.',
                          ),
                        )
                      : CustomPaint(
                          size: Size.infinite,
                          painter: _Chart(visible),
                        ),
                ),
                if (widget.state.weights.isNotEmpty)
                  Text(
                    '7 günlük ortalama: ${movingAverage(widget.state.weights, now).toStringAsFixed(1)} kg',
                  ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        key: const Key('weight-input'),
                        controller: wc,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Bugünkü kilo (kg)',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      key: const Key('save-weight'),
                      onPressed: () {
                        final v = double.tryParse(wc.text.replaceAll(',', '.'));
                        if (v != null) {
                          widget.state.addWeight(v);
                          wc.clear();
                        }
                      },
                      child: const Text('Kaydet'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.straighten),
            title: const Text('Vücut ölçüleri'),
            subtitle: Text(
              widget.state.measurements.isEmpty
                  ? 'Henüz ölçüm yok'
                  : '${widget.state.measurements.length} kayıt',
            ),
            trailing: const Icon(Icons.add),
            onTap: () => _measure(context),
          ),
        ),
      ],
    );
  }

  void _measure(BuildContext context) {
    const fields = [
      'Bel',
      'Karın',
      'Göğüs',
      'Omuz',
      'Sağ kol',
      'Sol kol',
      'Bacak',
    ];
    final ctrls = {for (final f in fields) f: TextEditingController()};
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MediaQuery.viewInsetsOf(sheetContext).bottom + 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Yeni ölçüm',
                style: Theme.of(sheetContext).textTheme.titleLarge,
              ),
              ...fields.map(
                (f) => Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextField(
                    controller: ctrls[f],
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(labelText: '$f (cm)'),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FilledButton(
                key: const Key('save-measurement'),
                onPressed: () {
                  widget.state.addMeasurement({
                    for (final e in ctrls.entries)
                      e.key:
                          double.tryParse(e.value.text.replaceAll(',', '.')) ??
                          0,
                  });
                  Navigator.pop(sheetContext);
                },
                child: const Text('Ölçümü kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chart extends CustomPainter {
  _Chart(this.data);
  final List<WeightEntry> data;
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xff65d6a6)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    if (data.length == 1) {
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        5,
        p..style = PaintingStyle.fill,
      );
      return;
    }
    final min = data.map((e) => e.value).reduce(math.min),
        max = data.map((e) => e.value).reduce(math.max),
        range = math.max(1, max - min);
    final path = Path();
    for (var i = 0; i < data.length; i++) {
      final x = i / (data.length - 1) * size.width,
          y =
              size.height -
              (data[i].value - min) / range * (size.height - 20) -
              10;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, p);
  }

  @override
  bool shouldRepaint(covariant _Chart old) => old.data != data;
}
