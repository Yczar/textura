import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CircuitryTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final canvas = context.canvas;

    final linePaint = Paint()
      ..color = Colors.green[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final dotPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    const gridSize = 30;

    for (var x = 0.0; x < size.width; x += gridSize) {
      for (var y = 0.0; y < size.height; y += gridSize) {
        canvas.drawCircle(Offset(x, y), 3, dotPaint);
      }
    }

    final random = Random(0);

    for (var x = 0.0; x < size.width; x += gridSize) {
      for (var y = 0.0; y < size.height; y += gridSize) {
        if (random.nextBool() && x + gridSize < size.width) {
          canvas.drawLine(Offset(x, y), Offset(x + gridSize, y), linePaint);
        }
        if (random.nextBool() && y + gridSize < size.height) {
          canvas.drawLine(Offset(x, y), Offset(x, y + gridSize), linePaint);
        }
      }
    }
  }
}
