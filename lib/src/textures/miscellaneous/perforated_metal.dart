import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PerforatedMetalTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base metal color
    final basePaint = Paint()
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding holes for perforated texture
    final holePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    const holeSpacing = 20;
    const holeRadius = 5.0;

    for (var i = holeSpacing; i < size.width; i += holeSpacing) {
      for (var j = holeSpacing; j < size.height; j += holeSpacing) {
        canvas.drawCircle(
          Offset(i.toDouble(), j.toDouble()),
          holeRadius,
          holePaint,
        );
      }
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
