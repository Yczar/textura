import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MarbleTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base marble color
    final basePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding vein patterns for texture
    final veinPaint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 2;

    final random = Random(0);
    const veinCount = 10;

    for (var i = 0; i < veinCount; i++) {
      final startX = random.nextDouble() * size.width;
      final startY = random.nextDouble() * size.height;
      final endX = random.nextDouble() * size.width;
      final endY = random.nextDouble() * size.height;

      final path = Path()
        ..moveTo(startX, startY)
        ..quadraticBezierTo(
          lerpDouble(startX, endX, 0.5) ?? 0 + random.nextDouble() * 50 - 25,
          lerpDouble(startY, endY, 0.5) ?? 0 + random.nextDouble() * 50 - 25,
          endX,
          endY,
        );

      canvas.drawPath(path, veinPaint);
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
