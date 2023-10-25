import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TrainTracksTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);

    final canvas = context.canvas;
    final paint = Paint()
      ..color = Colors.grey[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final width = child!.size.width;
    final height = child!.size.height;
    const trackDistance = 20;
    const sleeperLength = 10;
    const sleeperDistance = 30;

    for (var x = 0.0; x < width; x += trackDistance) {
      canvas.drawLine(Offset(x, 0), Offset(x, height), paint);
    }

    for (var y = 0.0; y < height; y += sleeperDistance) {
      for (var x = 0.0; x < width; x += trackDistance * 2) {
        canvas.drawRect(
          Rect.fromPoints(
            Offset(x, y),
            Offset(x + sleeperLength, y + 5),
          ),
          paint,
        );
      }
    }
  }
}
