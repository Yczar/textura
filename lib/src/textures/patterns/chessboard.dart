import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChessboardTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    const cellSize = 40.0;
    final rows = (child!.size.height / cellSize).ceil();
    final cols = (child!.size.width / cellSize).ceil();

    final darkPaint = Paint()..color = Colors.brown;
    final lightPaint = Paint()..color = Colors.white;

    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < cols; j++) {
        final isDarkCell = (i + j).isEven;
        final paint = isDarkCell ? darkPaint : lightPaint;
        final cellRect = Rect.fromLTWH(
          j * cellSize,
          i * cellSize,
          cellSize,
          cellSize,
        );
        canvas.drawRect(cellRect, paint);
      }
    }

    context.paintChild(child!, offset);
  }
}
