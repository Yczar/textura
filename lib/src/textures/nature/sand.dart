import 'dart:math';

import 'package:flutter/rendering.dart';

class SandTextureRenderObject extends RenderProxyBox {
  final Random _random = Random();

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final canvas = context.canvas;

    const numGrains = 2000;
    final sandPaint = Paint()..strokeCap = StrokeCap.round;

    for (var i = 0; i < numGrains; i++) {
      final sandX = _random.nextDouble() * size.width;
      final sandY = _random.nextDouble() * size.height;
      final sandRadius = _random.nextDouble() * 1.5;

      final brownBase = 100 + _random.nextInt(50);
      sandPaint.color = Color.fromRGBO(
        brownBase + 50,
        brownBase,
        brownBase - 50,
        _random.nextDouble(),
      );

      canvas.drawCircle(
        Offset(sandX + offset.dx, sandY + offset.dy),
        sandRadius,
        sandPaint,
      );
    }
  }
}
