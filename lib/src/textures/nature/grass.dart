import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GrassTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base ground color
    final basePaint = Paint()
      ..color = Colors.green[800]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding grass blades for texture
    final grassPaint = Paint()
      ..color = Colors.green[600]!
      ..style = PaintingStyle.stroke;

    final random = Random(0);
    const grassBladeCount = 500;

    for (var i = 0; i < grassBladeCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final height = random.nextDouble() * 20 + 10;
      final curveX = x + random.nextDouble() * 10 - 5;

      final path = Path()
        ..moveTo(x, y)
        ..quadraticBezierTo(curveX, y - height / 2, x, y - height);

      canvas.drawPath(path, grassPaint);
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
