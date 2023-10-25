import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RubberTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base rubber color
    final basePaint = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding noise pattern for rubber texture
    final noisePaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke;

    final random = Random(0);
    const noiseCount = 300;

    for (var i = 0; i < noiseCount; i++) {
      final startX = random.nextDouble() * size.width;
      final startY = random.nextDouble() * size.height;
      final endX = startX + random.nextDouble() * 10 - 5;
      final endY = startY + random.nextDouble() * 10 - 5;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), noisePaint);
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
