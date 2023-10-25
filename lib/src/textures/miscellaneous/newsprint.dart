import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewsprintTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);

    final canvas = context.canvas;
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    const rows = 100;
    const columns = 100;
    const dotSize = 5;
    final double spacing = max(
      child!.size.width / rows,
      child!.size.height / columns,
    ); // Spacing between the dots

    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < columns; j++) {
        final x = i * spacing + spacing / 2;
        final y = j * spacing + spacing / 2;
        final noise = Random().nextDouble() * dotSize;

        canvas.drawCircle(
          Offset(x, y) + offset,
          dotSize / 2 + noise,
          paint,
        );
      }
    }
  }
}
