import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WoodGrainTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base wood color
    final basePaint = Paint()
      ..color = Colors.brown[300]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding wood grain pattern for texture
    final patternPaint = Paint()
      ..color = Colors.brown[800]!
      ..style = PaintingStyle.stroke;

    final random = Random(0);
    for (var i = 0; i < size.width; i += 15) {
      final startX = i.toDouble();
      final startY = random.nextDouble() * size.height;
      final endX = startX + 30;
      final endY = startY + (random.nextDouble() - 0.5) * 40;

      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        patternPaint,
      );
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
