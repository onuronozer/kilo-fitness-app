import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/logic.dart';
import '../../data/seed_data.dart';
import '../../models/models.dart';
import '../../services/app_state.dart';
import '../../shared/widgets/exercise_illustration.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key, required this.state});
  final AppState state;
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late WorkoutDay workout;
  int seconds = 0;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    workout = workoutForDate(DateTime.now());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer(int n) {
    timer?.cancel();
    setState(() => seconds = n);
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds <= 1) {
        t.cancel();
        setState(() => seconds = 0);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Dinlenme tamamlandı')));
      } else {
        setState(() => seconds--);
      }
    });
  }

  @override
  Widget build(BuildContext c) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout.title,
                  style: Theme.of(c).textTheme.headlineMedium,
                ),
                Text(workout.subtitle),
              ],
            ),
          ),
          PopupMenuButton<WorkoutDay>(
            icon: const Icon(Icons.swap_horiz),
            onSelected: (v) => setState(() => workout = v),
            itemBuilder: (_) => workouts
                .map((w) => PopupMenuItem(value: w, child: Text(w.title)))
                .toList(),
          ),
        ],
      ),
      const SizedBox(height: 8),
      if (seconds > 0)
        Card(
          color: Theme.of(c).colorScheme.primaryContainer,
          child: ListTile(
            leading: const Icon(Icons.timer),
            title: Text(
              'Dinlenme  ${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}',
              style: Theme.of(c).textTheme.titleLarge,
            ),
            trailing: IconButton(
              onPressed: () {
                timer?.cancel();
                setState(() => seconds = 0);
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      if (workout.walk)
        Card(
          color: Theme.of(c).colorScheme.primaryContainer,
          child: ListTile(
            leading: const CircleAvatar(child: Text('1')),
            title: Text(
              '${widget.state.settings.inclineMinutes.toInt()} dk eğimli yürüyüş',
            ),
            subtitle: const Text('Ağırlık hareketlerinden önce ısınma'),
          ),
        ),
      if (workout.exercises.isEmpty)
        const Card(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Icon(Icons.self_improvement, size: 48),
                SizedBox(height: 12),
                Text('Bugün tam dinlenme günü.'),
              ],
            ),
          ),
        ),
      ...workout.exercises.map(
        (e) =>
            _ExerciseCard(state: widget.state, exercise: e, onRest: startTimer),
      ),
    ],
  );
}

class _ExerciseCard extends StatefulWidget {
  const _ExerciseCard({
    required this.state,
    required this.exercise,
    required this.onRest,
  });
  final AppState state;
  final Exercise exercise;
  final ValueChanged<int> onRest;
  @override
  State<_ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<_ExerciseCard> {
  @override
  Widget build(BuildContext c) {
    final e = widget.exercise,
        entries = widget.state.entries(DateTime.now(), e),
        prev = widget.state.previous(DateTime.now(), e);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(e.name, style: Theme.of(c).textTheme.titleLarge),
            Text(e.english, style: const TextStyle(color: Colors.white54)),
            InkWell(
              key: Key('illustration-${e.id}'),
              onTap: () => ExerciseIllustration.show(c, e),
              child: ExerciseIllustration(exercise: e),
            ),
            Text(
              e.prescriptionLabel,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (prev != null)
              Text(
                'Geçen sefer: ${prev.map((s) => '${s.kg.toStringAsFixed(1)} kg × ${s.reps}').join(' • ')}',
                style: const TextStyle(color: Colors.white60),
              ),
            const SizedBox(height: 8),
            const Row(
              children: [
                SizedBox(width: 34, child: Text('Set')),
                Expanded(child: Text('kg')),
                SizedBox(width: 8),
                Expanded(child: Text('Tekrar')),
                SizedBox(width: 44),
              ],
            ),
            ...List.generate(
              entries.length,
              (i) => Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    SizedBox(width: 34, child: Text('${i + 1}')),
                    Expanded(
                      child: TextFormField(
                        key: Key('kg-${e.id}-$i'),
                        initialValue: entries[i].kg == 0
                            ? ''
                            : entries[i].kg.toString(),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                        ],
                        onChanged: (v) {
                          entries[i].kg =
                              double.tryParse(v.replaceAll(',', '.')) ?? 0;
                          widget.state.persistSets();
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        key: Key('reps-${e.id}-$i'),
                        initialValue: entries[i].reps == 0
                            ? ''
                            : entries[i].reps.toString(),
                        keyboardType: TextInputType.number,
                        onChanged: (v) {
                          entries[i].reps = int.tryParse(v) ?? 0;
                          widget.state.persistSets();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 44,
                      child: Checkbox(
                        key: Key('done-${e.id}-$i'),
                        value: entries[i].done,
                        onChanged: (v) {
                          setState(() => entries[i].done = v ?? false);
                          widget.state.persistSets();
                          if (v == true) widget.onRest(e.rest);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (shouldProgress(entries, e.sets, e.maxReps))
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Harika! Bir sonraki antrenmanda ağırlığı küçük miktarda artırabilirsin.',
                  style: TextStyle(color: Theme.of(c).colorScheme.primary),
                ),
              ),
            Wrap(
              spacing: 6,
              children: [60, 90, 120, 150]
                  .map(
                    (s) => ActionChip(
                      label: Text('$s sn'),
                      onPressed: () => widget.onRest(s),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
