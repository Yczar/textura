import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SunsetTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    // Painting the gradient sky
    final gradientPaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(0, size.height),
        [
          Colors.deepOrange,
          Colors.purple,
          Colors.black,
        ],
        [0.3, 0.65, 1],
      );

    context.canvas.drawRect(
      Offset.zero & size,
      gradientPaint,
    );

    // Painting the sun
    final sunPaint = Paint()..color = Colors.yellow;

    context.canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.75),
      size.width * 0.15,
      sunPaint,
    );

    context.canvas.restore();

    super.paint(context, offset);
  }
}
