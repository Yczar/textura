import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GridTextureRenderObject extends RenderProxyBox {
  final Paint _gridPaint = Paint()
    ..color = Colors.grey.withValues(alpha: 0.5)
    ..style = PaintingStyle.stroke;

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final canvas = context.canvas;

    const gridSize = 20.0;

    for (var i = 0.0; i <= size.width; i += gridSize) {
      canvas.drawLine(
        offset + Offset(i, 0),
        offset + Offset(i, size.height),
        _gridPaint,
      );
    }

    for (var i = 0.0; i <= size.height; i += gridSize) {
      canvas.drawLine(
        offset + Offset(0, i),
        offset + Offset(size.width, i),
        _gridPaint,
      );
    }
  }
}
