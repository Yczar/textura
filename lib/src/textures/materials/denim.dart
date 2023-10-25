import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class _ConstellationsTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);

    final canvas = context.canvas;
    final paintStars = Paint()..color = Colors.white;
    final paintLines = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;

    const numberOfStars = 100;
    final random = Random();

    final starPositions = List<Offset>.generate(numberOfStars, (index) {
      return Offset(
        random.nextDouble() * child!.size.width,
        random.nextDouble() * child!.size.height,
      );
    });

    for (final star in starPositions) {
      canvas.drawCircle(star, 2, paintStars);
    }

    for (var i = 0; i < starPositions.length; i++) {
      for (var j = i + 1; j < starPositions.length; j++) {
        if (random.nextDouble() < 0.05) {
          canvas.drawLine(starPositions[i], starPositions[j], paintLines);
        }
      }
    }
  }
}
