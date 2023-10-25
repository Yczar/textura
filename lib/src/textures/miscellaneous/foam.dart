import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FoamTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final basePaint = Paint()
      ..color = Colors.white // Base color of the foam
      ..style = PaintingStyle.fill;

    // Fill the canvas with the base color
    context.canvas.drawRect(offset & size, basePaint);

    final bubblePaint = Paint()
      ..color = Colors.grey.withOpacity(0.1); // Color of the bubbles

    final random = Random(0);

    // Add circles of varying sizes and opacities to simulate bubbles
    for (var i = 0; i < 500; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 20;
      context.canvas.drawCircle(Offset(x, y), radius, bubblePaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
