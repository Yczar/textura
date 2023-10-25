import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GalaxyTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final random = Random(0);
    final starPaint = Paint()..color = Colors.white;
    final galaxyPaint = Paint()..color = Colors.blue[800]!;

    // Background paint
    context.canvas.drawRect(Offset.zero & size, galaxyPaint);

    // Drawing stars
    for (var i = 0; i < 200; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2;

      context.canvas.drawCircle(Offset(x, y), radius, starPaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
