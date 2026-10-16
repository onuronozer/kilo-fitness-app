import 'package:flutter/material.dart';

class AppTheme {
  static const seed = Color(0xff65d6a6);
  static ThemeData dark() => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xff0d1513),
    cardTheme: const CardThemeData(
      color: Color(0xff17211f),
      margin: EdgeInsets.symmetric(vertical: 6),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      isDense: true,
    ),
    navigationBarTheme: const NavigationBarThemeData(height: 68),
    useMaterial3: true,
  );
}
