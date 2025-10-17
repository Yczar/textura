import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GraniteTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base granite color
    final basePaint = Paint()
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding speckled pattern for texture
    final specklePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final random = Random(0);
    const speckleCount = 1000;

    for (var i = 0; i < speckleCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2;
      canvas.drawCircle(Offset(x, y), radius, specklePaint);
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
