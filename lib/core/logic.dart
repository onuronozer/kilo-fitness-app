import '../models/models.dart';

class PlanLogic {
  static final start = DateTime(2026, 10, 19);
  static int dayNumber(DateTime date) {
    final d = DateTime(
      date.year,
      date.month,
      date.day,
    ).difference(start).inDays;
    if (d < 0) return 1;
    return d < 15 ? d + 1 : (d % 7) + 16;
  }

  static int nutritionDay(DateTime date) {
    final d = DateTime(
      date.year,
      date.month,
      date.day,
    ).difference(start).inDays;
    return d < 0 ? 1 : (d % 15) + 1;
  }
}

double movingAverage(List<WeightEntry> entries, DateTime at) {
  final from = DateTime(
    at.year,
    at.month,
    at.day,
  ).subtract(const Duration(days: 6));
  final selected = entries
      .where((e) => !e.date.isBefore(from) && !e.date.isAfter(at))
      .toList();
  return selected.isEmpty
      ? 0
      : selected.fold<double>(0, (s, e) => s + e.value) / selected.length;
}

bool shouldProgress(List<SetEntry> sets, int targetSets, int maxReps) =>
    sets.length >= targetSets &&
    sets.take(targetSets).every((s) => s.done && s.reps >= maxReps);

({int calories, double protein, double carbs, double fat}) macroTotal(
  Iterable<Meal> meals,
  Set<String> completed,
) {
  final done = meals.where((m) => completed.contains(m.id));
  return (
    calories: done.fold(0, (s, m) => s + m.calories),
    protein: done.fold(0, (s, m) => s + m.protein),
    carbs: done.fold(0, (s, m) => s + m.carbs),
    fat: done.fold(0, (s, m) => s + m.fat),
  );
}
