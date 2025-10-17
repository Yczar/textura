import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HolographicTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.purple.withValues(alpha: 0.5),
          Colors.blue.withValues(alpha: 0.5),
          Colors.green.withValues(alpha: 0.5),
          Colors.yellow.withValues(alpha: 0.5),
          Colors.red.withValues(alpha: 0.5),
        ],
      ).createShader(Offset.zero & size);

    final step = 2 * pi / size.width;
    final path = Path();

    for (var x = 0.0; x <= size.width; x += 1) {
      final y = sin(x * step) * 20; // amplitude of the wave
      path.lineTo(x, y);
    }

    for (var x = size.width; x >= 0; x -= 1) {
      path.lineTo(x, size.height);
    }

    path.close();

    context.canvas.drawPath(path, paint);

    context.canvas.restore();

    super.paint(context, offset);
  }
}
