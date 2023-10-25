import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GraffitiTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final random = Random();
    final graffitiPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    const numberOfLines = 10;

    // Drawing graffiti lines and curves
    for (var i = 0; i < numberOfLines; i++) {
      final startX = random.nextDouble() * size.width;
      final startY = random.nextDouble() * size.height;
      final endX = random.nextDouble() * size.width;
      final endY = random.nextDouble() * size.height;
      final controlPointX = random.nextDouble() * size.width;
      final controlPointY = random.nextDouble() * size.height;

      context.canvas
          .drawLine(Offset(startX, startY), Offset(endX, endY), graffitiPaint);
      context.canvas.drawPoints(
        PointMode.points,
        [Offset(controlPointX, controlPointY)],
        graffitiPaint..strokeCap = StrokeCap.round,
      );
    }

    context.canvas.restore();
    super.paint(context, offset);
  }
}
