import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kilo_fitness_app/features/nutrition/nutrition_screen.dart';
import 'package:kilo_fitness_app/features/progress/progress_screen.dart';
import 'package:kilo_fitness_app/features/today/today_screen.dart';
import 'package:kilo_fitness_app/features/workout/workout_screen.dart';
import 'package:kilo_fitness_app/repositories/local_repository.dart';
import 'package:kilo_fitness_app/services/app_state.dart';
import 'package:kilo_fitness_app/shared/theme/app_theme.dart';

Future<AppState> state() async {
  final s = AppState(LocalRepository(MemoryStore()));
  await s.init();
  return s;
}

Widget app(Widget w) => MaterialApp(
  theme: AppTheme.dark(),
  home: Scaffold(body: SafeArea(child: w)),
);
void main() {
  testWidgets('Today ekranı görünür', (t) async {
    final s = await state();
    await t.pumpWidget(app(TodayScreen(state: s, onWorkout: () {})));
    expect(find.byKey(const Key('today-screen')), findsOneWidget);
    expect(find.text('Bugün'), findsOneWidget);
  });
  testWidgets('workout set girişi çalışır', (t) async {
    final s = await state();
    await t.pumpWidget(app(WorkoutScreen(state: s)));
    await t.enterText(
      find.byKey(const Key('kg-wide_grip_seated_cable_row-0')),
      '40',
    );
    await t.enterText(
      find.byKey(const Key('reps-wide_grip_seated_cable_row-0')),
      '10',
    );
    await t.tap(find.byKey(const Key('done-wide_grip_seated_cable_row-0')));
    await t.pump();
    expect(
      s.sets.values
          .expand((e) => e)
          .any((e) => e.done && e.kg == 40 && e.reps == 10),
      isTrue,
    );
  });
  testWidgets('öğün tamamlanır', (t) async {
    final s = await state();
    await t.pumpWidget(app(NutritionScreen(state: s)));
    final box = find.byType(Checkbox).first;
    await t.tap(box);
    await t.pump();
    expect(s.meals, isNotEmpty);
  });
  testWidgets('kilo girişi kaydedilir', (t) async {
    final s = await state();
    await t.pumpWidget(app(ProgressScreen(state: s)));
    await t.enterText(find.byKey(const Key('weight-input')), '81.5');
    await t.tap(find.byKey(const Key('save-weight')));
    await t.pump();
    expect(s.weights.single.value, 81.5);
  });
}
