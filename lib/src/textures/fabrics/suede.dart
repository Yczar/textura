import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SuedeTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final basePaint = Paint()
      ..color = Colors.brown[400]! // Base color of the suede
      ..style = PaintingStyle.fill;

    // Fill the canvas with the base color
    context.canvas.drawRect(offset & size, basePaint);

    final random = Random(0);

    // Apply a noise pattern to create a napped surface appearance
    final noisePaint = Paint()..strokeWidth = 1;

    for (var i = 0; i < 10000; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final opacity = random.nextDouble() * 0.5;

      noisePaint.color = Colors.brown.withOpacity(opacity);

      // Using drawCircle to simulate a point
      context.canvas.drawCircle(Offset(x, y), 1, noisePaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
