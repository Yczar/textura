import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CanvasTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base canvas color
    final basePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding canvas pattern for texture
    final patternPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke;

    const step = 5;
    for (var i = 0; i < size.width; i += step) {
      for (var j = 0; j < size.height; j += step) {
        final start = Offset(i.toDouble(), j.toDouble());
        final end = Offset(i.toDouble() + step, j.toDouble() + step);
        canvas.drawLine(start, end, patternPaint);
      }
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
