import 'package:flutter/material.dart';
import '../../core/logic.dart';
import '../../data/seed_data.dart';
import '../../models/models.dart';
import '../../services/app_state.dart';

class NutritionScreen extends StatelessWidget {
  NutritionScreen({super.key, required this.state});
  final AppState state;
  final meals = buildMeals();
  @override
  Widget build(BuildContext c) {
    final day = PlanLogic.nutritionDay(DateTime.now()),
        today = meals.where((m) => m.dayNumber == day).toList(),
        total = macroTotal(today, state.meals);
    return ListView(
      key: const Key('nutrition-screen'),
      padding: const EdgeInsets.all(16),
      children: [
        Text('Beslenme', style: Theme.of(c).textTheme.headlineMedium),
        Text('15 günlük plan • Gün $day'),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${total.calories} kcal',
                  style: Theme.of(c).textTheme.headlineSmall,
                ),
                Text(
                  '${total.protein.toStringAsFixed(0)} g protein  •  ${total.carbs.toStringAsFixed(0)} g karbonhidrat  •  ${total.fat.toStringAsFixed(0)} g yağ',
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (total.calories / (state.settings.workoutCalories))
                      .clamp(0, 1),
                ),
              ],
            ),
          ),
        ),
        ...today.map((m) => _MealCard(meal: m, state: state, all: meals)),
      ],
    );
  }
}

class _MealCard extends StatelessWidget {
  const _MealCard({required this.meal, required this.state, required this.all});
  final Meal meal;
  final AppState state;
  final List<Meal> all;
  @override
  Widget build(BuildContext c) => Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Checkbox(
              key: Key('meal-${meal.id}'),
              value: state.meals.contains(meal.id),
              onChanged: (_) => state.toggleMeal(meal.id),
            ),
            title: Text(meal.name),
            subtitle: Text(
              '${meal.mealType} • ${meal.calories} kcal • ${meal.protein.toInt()} g protein',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _detail(c),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () => _alternatives(c),
              icon: const Icon(Icons.swap_horiz),
              label: const Text('Alternatif göster'),
            ),
          ),
        ],
      ),
    ),
  );
  void _detail(BuildContext c) => showModalBottomSheet(
    context: c,
    isScrollControlled: true,
    builder: (x) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(meal.name, style: Theme.of(x).textTheme.headlineSmall),
            const SizedBox(height: 14),
            const Text(
              'Malzemeler',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(meal.ingredients),
            const SizedBox(height: 12),
            const Text(
              'Hazırlanış',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(meal.instructions),
            const SizedBox(height: 12),
            Text(
              '${meal.calories} kcal • P ${meal.protein.toInt()} g • K ${meal.carbs.toInt()} g • Y ${meal.fat.toInt()} g',
            ),
            const SizedBox(height: 8),
            const Text(
              'Et/tavuk miktarları çiğ; pirinç/bulgur miktarları kuru ağırlıktır.',
              style: TextStyle(color: Colors.white60),
            ),
          ],
        ),
      ),
    ),
  );
  void _alternatives(BuildContext c) => showModalBottomSheet(
    context: c,
    builder: (x) => SafeArea(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Yaklaşık benzer alternatifler',
            style: Theme.of(x).textTheme.titleLarge,
          ),
          ...meal.alternatives.map((n) {
            final alt = all.cast<Meal?>().firstWhere(
              (m) => m?.name == n,
              orElse: () => null,
            );
            return ListTile(
              title: Text(n),
              subtitle: alt == null
                  ? null
                  : Text(
                      '${alt.calories} kcal • ${alt.protein.toInt()} g protein',
                    ),
              onTap: () => Navigator.pop(x),
            );
          }),
        ],
      ),
    ),
  );
}
