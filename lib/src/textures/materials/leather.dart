import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LeatherTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final paint = Paint()
      ..color = const Color(0xFF8B4513) // Base color of the leather
      ..style = PaintingStyle.fill;

    // Fill the canvas with the base color
    context.canvas.drawRect(offset & size, paint);

    final grainPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.1)
      ..strokeWidth = 1;

    final random = Random(0);

    // Add random lines and curves to simulate the grain of the leather
    for (var i = 0; i < 200; i++) {
      final startX = random.nextDouble() * size.width;
      final startY = random.nextDouble() * size.height;
      final endX = startX + random.nextDouble() * 40 - 20;
      final endY = startY + random.nextDouble() * 40 - 20;
      context.canvas
          .drawLine(Offset(startX, startY), Offset(endX, endY), grainPaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
