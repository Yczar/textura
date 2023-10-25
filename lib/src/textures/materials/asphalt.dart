import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AsphaltTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final basePaint = Paint()
      ..color = const Color(0xFF2C2C2C) // Base color of the asphalt
      ..style = PaintingStyle.fill;

    // Fill the canvas with the base color
    context.canvas.drawRect(offset & size, basePaint);

    final grainPaint = Paint()..color = Colors.black.withOpacity(0.05);

    final random = Random(0);

    // Add noise to simulate the asphalt texture
    for (var i = 0; i < 1000; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2;
      context.canvas.drawCircle(Offset(x, y), radius, grainPaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
