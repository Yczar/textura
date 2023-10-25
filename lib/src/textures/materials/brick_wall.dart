import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BrickWallTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base wall color
    final basePaint = Paint()
      ..color = Colors.brown[300]!
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    // Adding brick pattern for texture
    final brickPaint = Paint()
      ..color = Colors.brown[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const brickWidth = 50;
    const brickHeight = 20;
    var offsetAdjustment = 0;

    for (var y = 0; y < size.height; y += brickHeight + 2) {
      for (var x = 0; x < size.width; x += brickWidth + 2) {
        var drawWidth = brickWidth;
        // Creating an offset every other row to simulate actual brick layout
        if (offsetAdjustment > 0) {
          drawWidth -= offsetAdjustment;
        }
        final brickRect =
            Offset(x.toDouble() + offsetAdjustment, y.toDouble()) &
                Size(drawWidth.toDouble(), brickHeight.toDouble());
        canvas.drawRect(brickRect, brickPaint);
        // Resetting the offset
        if (offsetAdjustment > 0) {
          offsetAdjustment = 0;
        }
      }
      // Applying an offset every other row
      offsetAdjustment = (offsetAdjustment == 0) ? brickWidth ~/ 2 : 0;
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
