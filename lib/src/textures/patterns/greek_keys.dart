import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GreekKeysTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final canvas = context.canvas;

    final paintLine = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const blockSize = 20.0;

    for (var x = 0.0; x < size.width; x += blockSize * 2) {
      for (var y = 0.0; y < size.height; y += blockSize * 2) {
        final path = Path()
          ..moveTo(x, y)
          ..relativeLineTo(blockSize, 0)
          ..relativeLineTo(0, blockSize)
          ..relativeLineTo(blockSize, 0)
          ..relativeLineTo(0, blockSize)
          ..relativeLineTo(-blockSize, 0)
          ..relativeLineTo(0, -blockSize)
          ..relativeLineTo(-blockSize, 0)
          ..close();

        canvas.drawPath(path, paintLine);
      }
    }
  }
}
