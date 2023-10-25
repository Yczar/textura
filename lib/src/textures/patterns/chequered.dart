import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChequeredTextureRenderObject extends RenderBox
    with RenderObjectWithChildMixin {
  ChequeredTextureRenderObject({
    this.squareSize = 20,
    this.color1 = Colors.black,
    this.color2 = Colors.white,
  });

  final double squareSize;
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

    for (var x = 0.0; x < size.width; x += squareSize) {
      for (var y = 00.0; y < size.height; y += squareSize) {
        final isEvenRow = (y ~/ squareSize).isEven;
        final isEvenColumn = (x ~/ squareSize).isEven;
        final isBlackSquare =
            (isEvenRow && isEvenColumn) || (!isEvenRow && !isEvenColumn);

        final paint = Paint()
          ..color = isBlackSquare ? color1 : color2
          ..style = PaintingStyle.fill;

        canvas.drawRect(Offset(x, y) & Size(squareSize, squareSize), paint);
      }
    }

    // Painting the child with an offset
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }
}
