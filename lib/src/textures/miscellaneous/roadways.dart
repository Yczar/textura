import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RoadwaysTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final roadPaint = Paint()
      ..color = Colors.grey[850]!
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Drawing road
    context.canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      roadPaint,
    );

    // Drawing dotted lines
    const dashLength = 10;
    const dashSpace = 10;
    final startY = size.height / 2.0;
    var startX = 0.0;

    while (startX < size.width) {
      context.canvas.drawLine(
        Offset(startX, startY),
        Offset(min(startX + dashLength, size.width), startY),
        linePaint,
      );
      startX += dashLength + dashSpace;
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
