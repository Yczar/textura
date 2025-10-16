import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StarsTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final basePaint = Paint()
      ..color = Colors.black // Base color of the night sky
      ..style = PaintingStyle.fill;

    // Fill the canvas with the base color of the night sky
    context.canvas.drawRect(offset & size, basePaint);

    final random = Random(0);

    // Add stars of various sizes and brightness
    for (var i = 0; i < 200; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2; // Varying the star sizes

      final starPaint = Paint()
        ..color = Colors.white.withValues(
          alpha: 0.5 + random.nextDouble() * 0.5,
        ) // Varying the brightness
        ..style = PaintingStyle.fill;

      context.canvas.drawCircle(Offset(x, y), radius, starPaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
