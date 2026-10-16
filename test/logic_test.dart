import 'package:flutter_test/flutter_test.dart';
import 'package:kilo_fitness_app/core/logic.dart';
import 'package:kilo_fitness_app/models/models.dart';
import 'package:kilo_fitness_app/data/seed_data.dart';
import 'dart:io';

void main() {
  test('15 günlük program tarihleri doğru', () {
    expect(PlanLogic.dayNumber(DateTime(2026, 10, 19)), 1);
    expect(PlanLogic.dayNumber(DateTime(2026, 11, 2)), 15);
    expect(PlanLogic.nutritionDay(DateTime(2026, 11, 3)), 1);
  });
  test('7 günlük hareketli ortalama gerçek aralığı kullanır', () {
    final e = List.generate(
      8,
      (i) => WeightEntry(DateTime(2026, 10, 1 + i), 80.0 + i),
    );
    expect(movingAverage(e, DateTime(2026, 10, 8)), 84);
  });
  test('double progression yalnızca tüm setlerde önerilir', () {
    expect(
      shouldProgress(
        List.generate(3, (_) => SetEntry(reps: 10, done: true)),
        3,
        10,
      ),
      isTrue,
    );
    expect(
      shouldProgress(
        [
          SetEntry(reps: 10, done: true),
          SetEntry(reps: 9, done: true),
          SetEntry(reps: 10, done: true),
        ],
        3,
        10,
      ),
      isFalse,
    );
  });
  test('tamamlanan öğün makroları toplanır', () {
    const a = Meal(
          id: 'a',
          name: 'A',
          mealType: 'x',
          ingredients: '',
          instructions: '',
          calories: 100,
          protein: 10,
          carbs: 12,
          fat: 2,
          dayNumber: 1,
        ),
        b = Meal(
          id: 'b',
          name: 'B',
          mealType: 'x',
          ingredients: '',
          instructions: '',
          calories: 200,
          protein: 20,
          carbs: 22,
          fat: 4,
          dayNumber: 1,
        );
    final t = macroTotal([a, b], {'a'});
    expect(t.calories, 100);
    expect(t.protein, 10);
  });
  test('planda kullanılan her egzersizin SVG asseti vardır', () {
    final exercises = workouts.expand((workout) => workout.exercises).toSet();
    for (final exercise in exercises) {
      expect(
        File(exercise.illustrationAsset).existsSync(),
        isTrue,
        reason: exercise.id,
      );
    }
  });
}
