import 'package:flutter_test/flutter_test.dart';
import 'package:kilo_fitness_app/models/models.dart';
import 'package:kilo_fitness_app/repositories/local_repository.dart';

void main() {
  test('local kayıt yazılır ve okunur', () async {
    final r = LocalRepository(MemoryStore());
    await r.saveWeights([WeightEntry(DateTime(2026), 82.4)]);
    expect((await r.loadWeights()).single.value, 82.4);
  });
  test('tamamlanmış setler restore edilir', () async {
    final r = LocalRepository(MemoryStore());
    await r.saveSets({
      'x': [SetEntry(kg: 40, reps: 10, done: true)],
    });
    final s = await r.loadSets();
    expect(s['x']!.single.done, isTrue);
    expect(s['x']!.single.kg, 40);
  });
}
