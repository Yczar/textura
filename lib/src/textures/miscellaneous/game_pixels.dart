import 'dart:math';

import 'package:flutter/rendering.dart';

class GamePixelsTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);

    final canvas = context.canvas;
    final paint = Paint();
    const pixelSize = 10;

    final rowCount = (child!.size.width / pixelSize).ceil();
    final columnCount = (child!.size.height / pixelSize).ceil();

    final random = Random(0);

    for (var row = 0; row < rowCount; row++) {
      for (var column = 0; column < columnCount; column++) {
        paint.color = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          0.5,
        );

        final left = row * pixelSize.toDouble();
        final top = column * pixelSize.toDouble();

        canvas.drawRect(
          Rect.fromLTWH(
            left + offset.dx,
            top + offset.dy,
            pixelSize.toDouble(),
            pixelSize.toDouble(),
          ),
          paint,
        );
      }
    }
  }
}
