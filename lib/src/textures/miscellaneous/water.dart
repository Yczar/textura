import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WaterTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base water color
    final basePaint = Paint()
      ..color = Colors.blue[300]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding wave pattern for texture
    final wavePaint = Paint()
      ..color = Colors.blue[700]!
      ..style = PaintingStyle.stroke;

    const num waveHeight = 20;
    final num waveWidth = size.width / 20;

    for (num y = 0; y < size.height; y += waveHeight * 2) {
      final path = Path()..moveTo(0, y.toDouble() + waveHeight);

      for (num x = 0; x < size.width; x += waveWidth.toInt()) {
        path.quadraticBezierTo(
          x + waveWidth / 2,
          y + (Random().nextBool() ? waveHeight : 0).toDouble(),
          (x + waveWidth).toDouble(),
          (y + waveHeight).toDouble(),
        );
      }

      canvas.drawPath(path, wavePaint);
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
