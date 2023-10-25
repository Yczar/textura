import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SolarSystemTextureRenderObject extends RenderProxyBox {
  final Random _random = Random();

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);

    final canvas = context.canvas;

    final sunPaint = Paint()..color = Colors.orangeAccent;
    final orbitPaint = Paint()..color = Colors.white.withOpacity(0.5);
    final planetPaint = Paint()..color = Colors.blueAccent;

    final sunPosition = Offset(child!.size.width / 2, child!.size.height / 2);

    canvas.drawCircle(sunPosition, 20, sunPaint);

    for (var i = 1; i <= 5; i++) {
      final orbitRadius = i * 40.0;
      canvas.drawCircle(sunPosition, orbitRadius, orbitPaint);

      final planetAngle = _random.nextDouble() * 2 * pi;
      final planetX = cos(planetAngle) * orbitRadius;
      final planetY = sin(planetAngle) * orbitRadius;
      canvas.drawCircle(
        Offset(sunPosition.dx + planetX, sunPosition.dy + planetY),
        5,
        planetPaint,
      );
    }
  }
}
