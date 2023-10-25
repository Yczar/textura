import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GraphPaperTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final canvas = context.canvas;

    final linePaint = Paint()
      ..color = Colors.blueGrey[100]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const cellSize = 20.0;

    // Drawing the vertical lines
    for (var i = cellSize; i < size.width; i += cellSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), linePaint);
    }

    // Drawing the horizontal lines
    for (var i = cellSize; i < size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), linePaint);
    }
  }
}
