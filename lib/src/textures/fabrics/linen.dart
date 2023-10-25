import 'dart:math';

import 'package:flutter/rendering.dart';

class LinenTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    const beige = Color(0xFFF5F5DC); // Defining a custom beige color

    final basePaint = Paint()
      ..color = beige
      ..style = PaintingStyle.fill;

    // Fill the canvas with the base color
    context.canvas.drawRect(offset & size, basePaint);

    final random = Random(0);
    final linePaint = Paint()..strokeWidth = 1;

    // Draw horizontal lines
    for (var y = 0.0; y <= size.height; y += 5) {
      linePaint.color = beige.withOpacity(0.5 + random.nextDouble() * 0.5);
      context.canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    // Draw vertical lines
    for (var x = 0.0; x <= size.width; x += 5) {
      linePaint.color = beige.withOpacity(0.5 + random.nextDouble() * 0.5);
      context.canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
