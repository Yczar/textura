import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CloudsTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final random = Random(0);

    final cloudPaint = Paint()..color = Colors.white.withValues(alpha: 0.8);

    // Drawing clouds
    for (var i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 50;

      context.canvas.drawCircle(Offset(x, y), radius, cloudPaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
