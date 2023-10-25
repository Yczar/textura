import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MudTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final basePaint = Paint()
      ..color = const Color(0xFF7B3F00) // Base mud color
      ..style = PaintingStyle.fill;

    // Fill the canvas with the base mud color
    context.canvas.drawRect(offset & size, basePaint);

    final random = Random();

    // Add some irregular spots to simulate the mud texture
    for (var i = 0; i < 300; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 20;
      final spotPaint = Paint()
        ..color = Color.lerp(
          Colors.brown,
          Colors.brown[300],
          random.nextDouble(),
        )! // Varying the mud color
        ..style = PaintingStyle.fill;

      context.canvas.drawCircle(Offset(x, y), radius, spotPaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
