import 'package:flutter/material.dart';
import '../services/app_state.dart';
import 'today/today_screen.dart';
import 'workout/workout_screen.dart';
import 'nutrition/nutrition_screen.dart';
import 'progress/progress_screen.dart';
import 'settings/settings_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.state});
  final AppState state;
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int i = 0;
  @override
  Widget build(BuildContext c) {
    final pages = [
      TodayScreen(state: widget.state, onWorkout: () => setState(() => i = 1)),
      WorkoutScreen(state: widget.state),
      NutritionScreen(state: widget.state),
      ProgressScreen(state: widget.state),
      SettingsScreen(state: widget.state),
    ];
    return Scaffold(
      body: SafeArea(child: pages[i]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: i,
        onDestinationSelected: (v) => setState(() => i = v),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.today_outlined),
            label: 'Bugün',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center),
            label: 'Antrenman',
          ),
          NavigationDestination(
            icon: Icon(Icons.restaurant_outlined),
            label: 'Beslenme',
          ),
          NavigationDestination(icon: Icon(Icons.show_chart), label: 'Gelişim'),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}
