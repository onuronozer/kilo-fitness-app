import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../models/models.dart';

class ExerciseIllustration extends StatelessWidget {
  const ExerciseIllustration({
    super.key,
    required this.exercise,
    this.height = 120,
  });
  final Exercise exercise;
  final double height;
  @override
  Widget build(BuildContext context) => Semantics(
    label: '${exercise.name} başlangıç ve bitiş pozisyonu',
    child: CustomPaint(
      size: Size(double.infinity, height),
      painter: _ExercisePainter(exercise.kind, Theme.of(context).colorScheme),
    ),
  );
  static void show(BuildContext context, Exercise e) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (c) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(e.name, style: Theme.of(c).textTheme.headlineSmall),
            Text(
              e.english,
              style: Theme.of(
                c,
              ).textTheme.titleMedium?.copyWith(color: Colors.white60),
            ),
            const SizedBox(height: 16),
            ExerciseIllustration(exercise: e, height: 260),
            const SizedBox(height: 12),
            ...e.tips.map(
              (t) => Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, size: 18),
                    const SizedBox(width: 8),
                    Expanded(child: Text(t)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    ),
  );
}

class _ExercisePainter extends CustomPainter {
  _ExercisePainter(this.kind, this.cs);
  final String kind;
  final ColorScheme cs;
  final stroke = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;
  void line(Canvas c, Offset a, Offset b, [Color? color]) {
    stroke.color = color ?? cs.onSurface;
    c.drawLine(a, b, stroke);
  }

  void person(Canvas c, double x, double y, {required bool end}) {
    stroke.color = cs.onSurface;
    c.drawCircle(Offset(x, y - 33), 7, stroke);
    line(c, Offset(x, y - 26), Offset(x, y));
    switch (kind) {
      case 'row':
        line(c, Offset(x, y - 20), Offset(end ? x - 20 : x + 20, y - 18));
        line(c, Offset(x, y), Offset(x - 14, y + 24));
        line(c, Offset(x, y), Offset(x + 18, y + 5));
        line(c, Offset(x + 18, y + 5), Offset(x + 30, y + 22));
        break;
      case 'pulldown':
        line(
          c,
          Offset(x, y - 20),
          Offset(end ? x - 18 : x - 12, end ? y - 31 : y - 55),
        );
        line(
          c,
          Offset(x, y - 20),
          Offset(end ? x + 18 : x + 12, end ? y - 31 : y - 55),
        );
        line(c, Offset(x, y), Offset(x - 12, y + 24));
        line(c, Offset(x, y), Offset(x + 12, y + 24));
        break;
      case 'lateral':
        line(c, Offset(x, y - 18), Offset(x - 22, end ? y - 20 : y));
        line(c, Offset(x, y - 18), Offset(x + 22, end ? y - 20 : y));
        line(c, Offset(x, y), Offset(x - 10, y + 26));
        line(c, Offset(x, y), Offset(x + 10, y + 26));
        break;
      case 'face':
        line(
          c,
          Offset(x, y - 19),
          Offset(end ? x - 18 : x - 28, end ? y - 31 : y - 19),
        );
        line(
          c,
          Offset(x, y - 19),
          Offset(end ? x + 18 : x + 28, end ? y - 31 : y - 19),
        );
        line(c, Offset(x, y), Offset(x - 10, y + 25));
        line(c, Offset(x, y), Offset(x + 10, y + 25));
        break;
      case 'legpress':
        line(c, Offset(x, y - 20), Offset(x - 12, y));
        line(c, Offset(x - 12, y), Offset(x - 28, y + 8));
        line(
          c,
          Offset(x - 12, y),
          Offset(end ? x + 20 : x + 4, end ? y - 14 : y + 4),
        );
        line(
          c,
          Offset(end ? x + 20 : x + 4, end ? y - 14 : y + 4),
          Offset(end ? x + 34 : x + 18, end ? y - 18 : y - 8),
        );
        break;
      case 'legcurl':
        line(c, Offset(x, y - 20), Offset(x, y));
        line(c, Offset(x, y), Offset(x + 20, y + 4));
        line(
          c,
          Offset(x + 20, y + 4),
          Offset(end ? x + 14 : x + 35, end ? y + 20 : y + 5),
        );
        break;
      case 'deadbug':
        line(c, Offset(x - 18, y), Offset(x + 18, y));
        line(
          c,
          Offset(x, y),
          Offset(end ? x + 24 : x + 10, end ? y - 14 : y - 20),
        );
        line(
          c,
          Offset(x, y),
          Offset(end ? x - 25 : x - 10, end ? y + 2 : y - 20),
        );
        break;
      case 'birddog':
        line(c, Offset(x - 12, y - 10), Offset(x + 12, y));
        line(
          c,
          Offset(x - 12, y - 10),
          Offset(end ? x - 36 : x - 18, end ? y - 12 : y + 14),
        );
        line(
          c,
          Offset(x + 12, y),
          Offset(end ? x + 38 : x + 18, end ? y : y + 18),
        );
        break;
      case 'sideplank':
        line(c, Offset(x - 25, y + 8), Offset(x + 20, end ? y - 5 : y + 8));
        line(c, Offset(x - 10, y + 4), Offset(x - 18, y + 20));
        line(c, Offset(x, y), Offset(x, end ? y - 28 : y - 15));
        break;
      case 'hinge':
        line(c, Offset(x, y - 25), Offset(end ? x + 13 : x, y));
        line(c, Offset(end ? x + 13 : x, y), Offset(x, y + 25));
        line(c, Offset(x, y), Offset(x - 10, y + 26));
        break;
      default:
        line(c, Offset(x, y - 18), Offset(end ? x + 15 : x, y));
        line(c, Offset(x, y), Offset(x - 10, y + 25));
        line(c, Offset(x, y), Offset(x + 10, y + 25));
    }
  }

  void arrow(Canvas c, Offset a, Offset b) {
    line(c, a, b, cs.primary);
    final ang = math.atan2(b.dy - a.dy, b.dx - a.dx);
    line(
      c,
      b,
      Offset(b.dx - 8 * math.cos(ang - .5), b.dy - 8 * math.sin(ang - .5)),
      cs.primary,
    );
    line(
      c,
      b,
      Offset(b.dx - 8 * math.cos(ang + .5), b.dy - 8 * math.sin(ang + .5)),
      cs.primary,
    );
  }

  @override
  void paint(Canvas c, Size s) {
    final y = s.height * .58, x1 = s.width * .25, x2 = s.width * .73;
    stroke.strokeWidth = s.height > 150 ? 4 : 2.5;
    final eq = Paint()
      ..color = cs.surfaceContainerHighest
      ..style = PaintingStyle.fill;
    if (['row', 'pulldown', 'face'].contains(kind)) {
      c.drawRect(Rect.fromLTWH(8, 15, 12, s.height - 30), eq);
      line(c, const Offset(20, 18), Offset(x2 + 35, 18), cs.outline);
      if (kind == 'row') {
        c.drawRect(
          Rect.fromCenter(center: Offset(x1, y + 22), width: 45, height: 7),
          eq,
        );
        c.drawRect(
          Rect.fromCenter(center: Offset(x2, y + 22), width: 45, height: 7),
          eq,
        );
        line(c, Offset(20, y - 18), Offset(x1 + 20, y - 18), cs.outline);
        line(c, Offset(20, y - 18), Offset(x2 - 20, y - 18), cs.outline);
      }
    }
    if (kind == 'legpress') {
      for (final x in [x1, x2]) {
        line(c, Offset(x - 35, y + 30), Offset(x - 12, y - 4), cs.outline);
        line(c, Offset(x + 30, y - 30), Offset(x + 42, y + 10), cs.primary);
      }
    }
    if (kind == 'legcurl') {
      for (final x in [x1, x2]) {
        c.drawRect(
          Rect.fromCenter(center: Offset(x, y + 10), width: 52, height: 7),
          eq,
        );
        c.drawCircle(Offset(x + 30, y + 14), 6, eq);
      }
    }
    person(c, x1, y, end: false);
    person(c, x2, y, end: true);
    arrow(c, Offset(s.width * .45, y - 5), Offset(s.width * .55, y - 5));
    final tp = TextPainter(textDirection: TextDirection.ltr);
    for (final p in [(x1, 'BAŞLANGIÇ'), (x2, 'BİTİŞ')]) {
      tp.text = TextSpan(
        text: p.$2,
        style: TextStyle(
          color: cs.onSurfaceVariant,
          fontSize: s.height > 150 ? 12 : 8,
          fontWeight: FontWeight.bold,
        ),
      );
      tp.layout();
      tp.paint(c, Offset(p.$1 - tp.width / 2, s.height - tp.height));
    }
  }

  @override
  bool shouldRepaint(covariant _ExercisePainter old) =>
      old.kind != kind || old.cs != cs;
}
