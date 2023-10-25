import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SilkTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base silk color
    final basePaint = Paint()
      ..color = Colors.deepPurple[100]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding silk pattern for texture
    final patternPaint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.deepPurple[200]!, Colors.deepPurple[50]!],
      ).createShader(
        Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const step = 10;
    for (var i = 0.0; i < size.width; i += step) {
      final start = Offset(i, 0);
      final end = Offset(size.width - i, size.height);
      canvas.drawLine(start, end, patternPaint);
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
