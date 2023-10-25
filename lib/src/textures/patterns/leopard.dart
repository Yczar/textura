import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LeopardTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final basePaint = Paint()
      ..color = Colors.orange[200]! // Base color of the leopard skin
      ..style = PaintingStyle.fill;

    // Fill the canvas with the base color
    context.canvas.drawRect(offset & size, basePaint);

    final spotPaint = Paint()
      ..color = Colors.brown // Color of the leopard spots
      ..style = PaintingStyle.fill;

    final random = Random(0);

    // Draw the leopard spots
    for (var i = 0; i < 150; i++) {
      final centerX = random.nextDouble() * size.width;
      final centerY = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 20 + 10;
      context.canvas.drawCircle(
        Offset(centerX, centerY),
        radius,
        spotPaint,
      );

      // Drawing smaller circle inside to create a two-toned spot
      spotPaint.color = Colors.orange[400]!;
      context.canvas.drawCircle(
        Offset(centerX, centerY),
        radius * 0.5,
        spotPaint,
      );
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
