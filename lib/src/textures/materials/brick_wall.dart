import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BrickWallTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  BrickWallTextureRenderObject({
    this.baseColor = Colors.brown,
    this.brickColor = const Color.fromARGB(255, 93, 64, 55),
    this.brickWidth = 50,
    this.brickHeight = 20,
  });
  final Color baseColor;
  final Color brickColor;
  final double brickWidth;
  final double brickHeight;

  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    final basePaint = Paint()
      ..color = baseColor
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, basePaint);

    final brickPaint = Paint()
      ..color = brickColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final brickColumns = size.width ~/ brickWidth;
    var isOddRow = false;

    for (var y = 0; y < size.height; y += brickHeight.toInt() + 4) {
      isOddRow = !isOddRow;
      for (var col = 0; col < brickColumns; col++) {
        num x = col * (brickWidth + 5);
        final drawWidth = brickWidth;
        // If the row is odd, shift every other column
        if (isOddRow) {
          x += 20;
        }

        final brickRect =
            Offset(x.toDouble(), y.toDouble()) & Size(drawWidth, brickHeight);
        canvas.drawRect(brickRect, brickPaint);
      }
    }

    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
