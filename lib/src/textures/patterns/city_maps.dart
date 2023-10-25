import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CityMapsTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final canvas = context.canvas;

    final roadPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final buildingPaint = Paint()
      ..color = Colors.brown[300]!
      ..style = PaintingStyle.fill;

    const blockSize = 40.0;

    for (var x = 0.0; x < size.width; x += blockSize) {
      for (var y = 0.0; y < size.height; y += blockSize) {
        if ((x + y) % (blockSize * 2) == 0) {
          final building = Rect.fromLTWH(x, y, blockSize, blockSize);
          canvas.drawRect(building, buildingPaint);
        }
      }
    }

    for (var x = 0.0; x < size.width; x += blockSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), roadPaint);
    }

    for (var y = 0.0; y < size.height; y += blockSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), roadPaint);
    }
  }
}
