import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

abstract class LocalStore {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
}

class PreferencesStore implements LocalStore {
  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();
  @override
  Future<String?> read(String key) async => (await _prefs).getString(key);
  @override
  Future<void> write(String key, String value) async =>
      (await _prefs).setString(key, value);
}

class MemoryStore implements LocalStore {
  final data = <String, String>{};
  @override
  Future<String?> read(String k) async => data[k];
  @override
  Future<void> write(String k, String v) async {
    data[k] = v;
  }
}

class LocalRepository {
  LocalRepository(this.store);
  final LocalStore store;
  Future<Map<String, List<SetEntry>>> loadSets() async {
    final s = await store.read('sets');
    if (s == null) return {};
    return (jsonDecode(s) as Map<String, dynamic>).map(
      (k, v) =>
          MapEntry(k, (v as List).map((e) => SetEntry.fromJson(e)).toList()),
    );
  }

  Future<void> saveSets(Map<String, List<SetEntry>> v) => store.write(
    'sets',
    jsonEncode(v.map((k, v) => MapEntry(k, v.map((e) => e.toJson()).toList()))),
  );
  Future<Set<String>> loadMeals() async {
    final s = await store.read('meals');
    return s == null ? {} : (jsonDecode(s) as List).cast<String>().toSet();
  }

  Future<void> saveMeals(Set<String> v) =>
      store.write('meals', jsonEncode(v.toList()));
  Future<List<WeightEntry>> loadWeights() async {
    final s = await store.read('weights');
    return s == null
        ? []
        : (jsonDecode(s) as List).map((e) => WeightEntry.fromJson(e)).toList();
  }

  Future<void> saveWeights(List<WeightEntry> v) =>
      store.write('weights', jsonEncode(v.map((e) => e.toJson()).toList()));
  Future<List<Measurement>> loadMeasurements() async {
    final s = await store.read('measurements');
    return s == null
        ? []
        : (jsonDecode(s) as List).map((e) => Measurement.fromJson(e)).toList();
  }

  Future<void> saveMeasurements(List<Measurement> v) => store.write(
    'measurements',
    jsonEncode(v.map((e) => e.toJson()).toList()),
  );
  Future<SettingsData> loadSettings() async {
    final s = await store.read('settings');
    return s == null ? SettingsData() : SettingsData.fromJson(jsonDecode(s));
  }

  Future<void> saveSettings(SettingsData v) =>
      store.write('settings', jsonEncode(v.toJson()));
}
