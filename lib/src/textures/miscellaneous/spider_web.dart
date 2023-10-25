import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SpiderWebTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final canvas = context.canvas;

    final webPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final maxRadius = min(size.width, size.height) / 2;

    const numRings = 10;
    const numSpokes = 24;

    for (var i = 1; i <= numRings; i++) {
      final radius = i * maxRadius / numRings;
      canvas.drawCircle(Offset(centerX, centerY), radius, webPaint);
    }

    for (var i = 0; i < numSpokes; i++) {
      final angle = 2 * pi * i / numSpokes;
      final x = centerX + maxRadius * cos(angle);
      final y = centerY + maxRadius * sin(angle);
      canvas.drawLine(Offset(centerX, centerY), Offset(x, y), webPaint);
    }
  }
}
