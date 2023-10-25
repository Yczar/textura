import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SpiralsTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    const spiralSpacing = 20.0;
    const numSpirals = 10;

    for (var i = 0; i < numSpirals; i++) {
      for (var j = 0; j < numSpirals; j++) {
        _drawSpiral(
          canvas: context.canvas,
          paint: paint,
          cx: i * spiralSpacing * 2,
          cy: j * spiralSpacing * 2,
          maxRadius: spiralSpacing,
        );
      }
    }

    context.canvas.restore();
    super.paint(context, offset);
  }

  void _drawSpiral({
    required Canvas canvas,
    required Paint paint,
    required double cx,
    required double cy,
    required double maxRadius,
  }) {
    const numSteps = 100;
    final stepSize = maxRadius / numSteps;
    final path = Path()..moveTo(cx, cy);

    for (var i = 0; i < numSteps; i++) {
      final angle = i * pi / 10;
      final radius = i * stepSize;
      final x = cx + radius * cos(angle);
      final y = cy + radius * sin(angle);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }
}
