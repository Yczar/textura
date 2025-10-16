import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SteelTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base steel color
    final basePaint = Paint()
      ..color = Colors.grey[850]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding brushed lines for texture
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final random = Random(0);
    const lineCount = 50;

    for (var i = 0; i < lineCount; i++) {
      final y = random.nextDouble() * size.height;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
