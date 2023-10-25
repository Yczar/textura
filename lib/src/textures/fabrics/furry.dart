import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FurryTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final basePaint = Paint()
      ..color = Colors.brown[700]! // Base color of the fur
      ..style = PaintingStyle.fill;

    // Fill the canvas with the base color
    context.canvas.drawRect(offset & size, basePaint);

    final furPaint = Paint()
      ..color = Colors.brown[500]! // Color of the fur strands
      ..strokeWidth = 2;

    final random = Random();

    // Draw the fur strands
    for (var i = 0; i < 1000; i++) {
      final startX = random.nextDouble() * size.width;
      final startY = random.nextDouble() * size.height;
      final endX = startX + random.nextDouble() * 10 - 5;
      final endY = startY + random.nextDouble() * 10 - 5;
      context.canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        furPaint,
      );
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
