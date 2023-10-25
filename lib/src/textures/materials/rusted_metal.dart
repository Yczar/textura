import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RustedMetalTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base metal color
    final basePaint = Paint()
      ..color = Colors.brown[900]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding rust patches for texture
    final rustPaint = Paint()
      ..color = Colors.orange[700]!
      ..style = PaintingStyle.fill;

    final random = Random(0);
    const rustPatchCount = 50;

    for (var i = 0; i < rustPatchCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 20;

      canvas.drawCircle(Offset(x, y), radius, rustPaint);
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
