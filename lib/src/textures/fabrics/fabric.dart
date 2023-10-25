import 'dart:math';
import 'package:flutter/material.dart';

class FabricTextureRenderObject extends RenderBox {
  @override
  void performLayout() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base color of the fabric
    final basePaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding woven pattern for texture
    final patternPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < size.width; i += 5) {
      for (var j = 0; j < size.height; j += 5) {
        if (Random().nextBool()) {
          canvas.drawLine(
            Offset(i.toDouble(), j.toDouble()),
            Offset(i + 5.0, j + 5.0),
            patternPaint,
          );
        } else {
          canvas.drawLine(
            Offset(i.toDouble(), j + 5.0),
            Offset(i + 5.0, j.toDouble()),
            patternPaint,
          );
        }
      }
    }
  }
}
