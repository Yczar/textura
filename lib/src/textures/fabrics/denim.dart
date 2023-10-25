import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DenimTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base denim color
    final basePaint = Paint()
      ..color = Colors.blue[900]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding denim pattern for texture
    final patternPaint = Paint()
      ..color = Colors.blue[700]!
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < size.width; i += 5) {
      for (var j = 0; j < size.height; j += 5) {
        final start = Offset(i.toDouble(), j.toDouble());
        final end = Offset(i.toDouble() + 5, j.toDouble() + 5);
        canvas.drawLine(start, end, patternPaint);
      }
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
