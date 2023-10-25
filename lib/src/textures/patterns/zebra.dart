import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ZebraTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Drawing the zebra stripes
    for (var i = 0; i < size.height; i += 20) {
      final isWhite = (i ~/ 20).isEven;
      final waveHeight = sin(i / 20) * 10;
      final paint = isWhite ? whitePaint : blackPaint;

      context.canvas.drawRect(
        Rect.fromPoints(
          Offset(0, i.toDouble() + waveHeight),
          Offset(size.width, i.toDouble() + 20 + waveHeight),
        ),
        paint,
      );
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
