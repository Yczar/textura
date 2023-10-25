import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaperTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final paint = Paint()
      ..color = Colors.grey[100]! // Base color of the paper
      ..style = PaintingStyle.fill;

    // Fill the canvas with the base color
    context.canvas.drawRect(offset & size, paint);

    final grainPaint = Paint()
      ..color = Colors.grey[300]!.withOpacity(0.5)
      ..strokeWidth = 0.5;

    final random = Random();

    // Add subtle noise to simulate the grain of the paper
    for (var i = 0; i < 1000; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      context.canvas.drawCircle(Offset(x, y), 1, grainPaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
