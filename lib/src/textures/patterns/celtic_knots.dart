import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CelticKnotsTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);

    final canvas = context.canvas;
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    const step = 20.0;
    final width = child!.size.width;
    final height = child!.size.height;

    for (var x = 0.0; x <= width; x += step) {
      for (var y = 0.0; y <= height; y += step) {
        final path = Path()
          ..moveTo(x, y)
          ..relativeLineTo(step, step)
          ..moveTo(x + step, y)
          ..relativeLineTo(-step, step);
        canvas.drawPath(path, paint);
      }
    }
  }
}
