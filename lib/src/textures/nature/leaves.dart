import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LeavesTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base color
    final basePaint = Paint()
      ..color = Colors.green[700]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding leaf veins pattern for texture
    final leafPaint = Paint()
      ..color = Colors.green[900]!
      ..style = PaintingStyle.stroke;

    final random = Random();
    const leafCount = 100;

    for (var i = 0; i < leafCount; i++) {
      final startX = random.nextDouble() * size.width;
      final startY = random.nextDouble() * size.height;
      final endX = startX + random.nextDouble() * 40 - 20;
      final endY = startY + random.nextDouble() * 40 - 20;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), leafPaint);
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
