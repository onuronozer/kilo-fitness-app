import 'package:flutter/material.dart';
import '../../core/logic.dart';
import '../../data/seed_data.dart';
import '../../services/app_state.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key, required this.state, required this.onWorkout});
  final AppState state;
  final VoidCallback onWorkout;
  @override
  Widget build(BuildContext c) {
    final now = DateTime.now(),
        dn = PlanLogic.dayNumber(now),
        ni = PlanLogic.nutritionDay(now),
        monday = now.weekday == DateTime.monday;
    final w = workouts[((dn - 1) % workouts.length)];
    return ListView(
      key: const Key('today-screen'),
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'KILO',
          style: Theme.of(c).textTheme.labelLarge?.copyWith(
            color: Theme.of(c).colorScheme.primary,
            letterSpacing: 3,
          ),
        ),
        Text('Bugün', style: Theme.of(c).textTheme.displaySmall),
        Text(
          '${now.day}.${now.month}.${now.year} • Program günü $dn',
          style: const TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: 18),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(w.title, style: Theme.of(c).textTheme.headlineSmall),
                Text(w.subtitle),
                const SizedBox(height: 10),
                Text(
                  '${w.exercises.length} hareket${w.walk ? ' • ${state.settings.inclineMinutes.toInt()} dk eğimli yürüyüş' : ''}',
                ),
                if (monday) ...[
                  const SizedBox(height: 8),
                  const Chip(
                    avatar: Icon(Icons.sports_soccer),
                    label: Text('Pazartesi halı saha'),
                  ),
                ],
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: onWorkout,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Antrenmanı aç'),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text('Beslenme • Gün $ni'),
            subtitle: Text(
              '${buildMeals().where((m) => m.dayNumber == ni).length} öğün planlandı',
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.flag_outlined),
            title: const Text('Günlük hedef'),
            subtitle: Text(
              '${w.walk ? state.settings.workoutCalories.toInt() : state.settings.restCalories.toInt()} kcal • ${state.settings.protein.toInt()} g protein • ${state.settings.water.toStringAsFixed(1)} L su',
            ),
          ),
        ),
      ],
    );
  }
}
