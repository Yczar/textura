import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ConcreteTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base concrete color
    final basePaint = Paint()
      ..color = Colors.grey[400]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding noise pattern for texture
    final noisePaint = Paint()
      ..color = Colors.grey[600]!
      ..style = PaintingStyle.stroke;

    final random = Random();
    const step = 5;
    for (var i = 0; i < size.width; i += step) {
      for (var j = 0; j < size.height; j += step) {
        if (random.nextBool()) {
          final startX = i.toDouble() + random.nextDouble() * step;
          final startY = j.toDouble() + random.nextDouble() * step;
          final endX = i.toDouble() + random.nextDouble() * step;
          final endY = j.toDouble() + random.nextDouble() * step;
          canvas.drawLine(
            Offset(startX, startY),
            Offset(endX, endY),
            noisePaint,
          );
        }
      }
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
