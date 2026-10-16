import 'package:flutter/material.dart';
import '../models/models.dart';
import '../repositories/local_repository.dart';

class AppState extends ChangeNotifier {
  AppState(this.repo);
  final LocalRepository repo;
  bool ready = false;
  Map<String, List<SetEntry>> sets = {};
  Set<String> meals = {};
  List<WeightEntry> weights = [];
  List<Measurement> measurements = [];
  SettingsData settings = SettingsData();
  Future<void> init() async {
    sets = await repo.loadSets();
    meals = await repo.loadMeals();
    weights = await repo.loadWeights();
    measurements = await repo.loadMeasurements();
    settings = await repo.loadSettings();
    ready = true;
    notifyListeners();
  }

  String setKey(DateTime d, String exercise) =>
      '${d.year}-${d.month}-${d.day}:$exercise';
  List<SetEntry> entries(DateTime d, Exercise e) => sets.putIfAbsent(
    setKey(d, e.id),
    () => List.generate(e.sets, (_) => SetEntry()),
  );
  List<SetEntry>? previous(DateTime d, Exercise e) {
    final keys =
        sets.keys
            .where(
              (k) => k.endsWith(':${e.id}') && k.compareTo(setKey(d, e.id)) < 0,
            )
            .toList()
          ..sort();
    return keys.isEmpty ? null : sets[keys.last];
  }

  Future<void> persistSets() async {
    await repo.saveSets(sets);
    notifyListeners();
  }

  Future<void> toggleMeal(String id) async {
    meals.contains(id) ? meals.remove(id) : meals.add(id);
    await repo.saveMeals(meals);
    notifyListeners();
  }

  Future<void> addWeight(double v) async {
    weights.removeWhere((e) => DateUtils.isSameDay(e.date, DateTime.now()));
    weights.add(WeightEntry(DateTime.now(), v));
    weights.sort((a, b) => a.date.compareTo(b.date));
    await repo.saveWeights(weights);
    notifyListeners();
  }

  Future<void> addMeasurement(Map<String, double> v) async {
    measurements.add(Measurement(DateTime.now(), v));
    await repo.saveMeasurements(measurements);
    notifyListeners();
  }

  Future<void> saveSettings() async {
    await repo.saveSettings(settings);
    notifyListeners();
  }
}
