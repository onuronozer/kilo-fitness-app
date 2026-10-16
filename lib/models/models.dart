class Exercise {
  const Exercise({
    required this.id,
    required this.name,
    required this.english,
    required this.sets,
    required this.minReps,
    required this.maxReps,
    required this.tips,
    this.rest = 90,
  });
  final String id, name, english;
  String get illustrationAsset => 'assets/exercises/$id.svg';
  final int sets, minReps, maxReps, rest;
  final List<String> tips;
}

class WorkoutDay {
  const WorkoutDay(
    this.title,
    this.subtitle,
    this.exercises, {
    this.walk = true,
  });
  final String title, subtitle;
  final List<Exercise> exercises;
  final bool walk;
}

class SetEntry {
  SetEntry({this.kg = 0, this.reps = 0, this.done = false});
  double kg;
  int reps;
  bool done;
  Map<String, dynamic> toJson() => {'kg': kg, 'reps': reps, 'done': done};
  factory SetEntry.fromJson(Map<String, dynamic> j) => SetEntry(
    kg: (j['kg'] as num?)?.toDouble() ?? 0,
    reps: j['reps'] as int? ?? 0,
    done: j['done'] as bool? ?? false,
  );
}

class Meal {
  const Meal({
    required this.id,
    required this.name,
    required this.mealType,
    required this.ingredients,
    required this.instructions,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.dayNumber,
    this.alternatives = const [],
  });
  final String id, name, mealType, ingredients, instructions;
  final int calories, dayNumber;
  final double protein, carbs, fat;
  final List<String> alternatives;
}

class WeightEntry {
  const WeightEntry(this.date, this.value);
  final DateTime date;
  final double value;
  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'value': value,
  };
  factory WeightEntry.fromJson(Map<String, dynamic> j) => WeightEntry(
    DateTime.parse(j['date'] as String),
    (j['value'] as num).toDouble(),
  );
}

class Measurement {
  const Measurement(this.date, this.values);
  final DateTime date;
  final Map<String, double> values;
  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'values': values,
  };
  factory Measurement.fromJson(Map<String, dynamic> j) => Measurement(
    DateTime.parse(j['date'] as String),
    (j['values'] as Map).map(
      (k, v) => MapEntry(k as String, (v as num).toDouble()),
    ),
  );
}

class SettingsData {
  SettingsData({
    this.workoutCalories = 2300,
    this.restCalories = 2200,
    this.protein = 165,
    this.water = 3,
    this.targetWeight = 80,
    this.inclineMinutes = 10,
  });
  double workoutCalories,
      restCalories,
      protein,
      water,
      targetWeight,
      inclineMinutes;
  Map<String, dynamic> toJson() => {
    'workoutCalories': workoutCalories,
    'restCalories': restCalories,
    'protein': protein,
    'water': water,
    'targetWeight': targetWeight,
    'inclineMinutes': inclineMinutes,
  };
  factory SettingsData.fromJson(Map<String, dynamic> j) => SettingsData(
    workoutCalories: (j['workoutCalories'] as num?)?.toDouble() ?? 2300,
    restCalories: (j['restCalories'] as num?)?.toDouble() ?? 2200,
    protein: (j['protein'] as num?)?.toDouble() ?? 165,
    water: (j['water'] as num?)?.toDouble() ?? 3,
    targetWeight: (j['targetWeight'] as num?)?.toDouble() ?? 80,
    inclineMinutes: (j['inclineMinutes'] as num?)?.toDouble() ?? 10,
  );
}
