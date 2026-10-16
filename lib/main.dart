import 'package:flutter/material.dart';
import 'repositories/local_repository.dart';
import 'services/app_state.dart';
import 'shared/theme/app_theme.dart';
import 'features/app_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(KiloApp(state: AppState(LocalRepository(PreferencesStore()))));
}

class KiloApp extends StatefulWidget {
  const KiloApp({super.key, required this.state});
  final AppState state;
  @override
  State<KiloApp> createState() => _KiloAppState();
}

class _KiloAppState extends State<KiloApp> {
  @override
  void initState() {
    super.initState();
    widget.state.init();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'KILO',
    theme: AppTheme.dark(),
    home: AnimatedBuilder(
      animation: widget.state,
      builder: (c, _) => widget.state.ready
          ? AppShell(state: widget.state)
          : const Scaffold(body: Center(child: CircularProgressIndicator())),
    ),
  );
}
