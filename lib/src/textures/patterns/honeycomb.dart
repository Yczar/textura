import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HoneycombTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  HoneycombTextureRenderObject({
    this.hexagonSize = 50,
    this.color1 = Colors.yellow,
    this.color2 = Colors.orange,
  });

  final double hexagonSize;
  final Color color1;
  final Color color2;

  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    final sqrtThree = sqrt(3);
    var yOffset = 0.0;

    for (var y = 0.0; y < size.height + hexagonSize; y += hexagonSize * 1.5) {
      for (var x = 0.0;
          x < size.width + hexagonSize;
          x += sqrtThree * hexagonSize) {
        var xPos = x;
        if (yOffset == hexagonSize * 0.75) {
          xPos -= sqrtThree * hexagonSize / 2;
        }

        final hexagonPath = Path()
          ..moveTo(xPos + hexagonSize * sqrtThree / 2, y + yOffset)
          ..lineTo(
            xPos + hexagonSize * sqrtThree,
            y + yOffset + hexagonSize * 0.5,
          )
          ..lineTo(
            xPos + hexagonSize * sqrtThree / 2,
            y + yOffset + hexagonSize,
          )
          ..lineTo(xPos, y + yOffset + hexagonSize)
          ..lineTo(
            xPos - hexagonSize * sqrtThree / 2,
            y + yOffset + hexagonSize * 0.5,
          )
          ..lineTo(xPos, y + yOffset)
          ..close();

        final paint = Paint()
          ..color =
              (x / hexagonSize).round() % 2 == (y / hexagonSize).round() % 2
                  ? color1
                  : color2
          ..style = PaintingStyle.fill;

        canvas.drawPath(hexagonPath, paint);
      }

      yOffset = (yOffset == 0) ? hexagonSize * 0.75 : 0;
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
