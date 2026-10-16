import 'package:flutter/material.dart';
import '../../models/models.dart';

class ExerciseIllustration extends StatelessWidget {
  const ExerciseIllustration({
    super.key,
    required this.exercise,
    this.height = 168,
  });
  final Exercise exercise;
  final double height;

  @override
  Widget build(BuildContext context) => Semantics(
    label: '${exercise.name} başlangıç ve bitiş pozisyonu',
    image: true,
    child: SizedBox(
      width: double.infinity,
      height: height,
      child: Image.asset(
        exercise.illustrationAsset,
        fit: BoxFit.contain,
        semanticLabel: exercise.name,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          exercise.illustrationFallbackAsset,
          fit: BoxFit.contain,
          semanticLabel: exercise.name,
        ),
      ),
    ),
  );

  static void show(BuildContext context, Exercise exercise) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(sheetContext).colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: Theme.of(sheetContext).textTheme.headlineSmall,
                ),
                Text(
                  exercise.english,
                  style: Theme.of(
                    sheetContext,
                  ).textTheme.titleMedium?.copyWith(color: Colors.white60),
                ),
                const SizedBox(height: 16),
                ExerciseIllustration(exercise: exercise, height: 300),
                const SizedBox(height: 12),
                ...exercise.tips.map(
                  (tip) => Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle_outline, size: 18),
                        const SizedBox(width: 8),
                        Expanded(child: Text(tip)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
