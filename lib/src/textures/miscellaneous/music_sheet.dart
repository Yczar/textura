import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MusicSheetTextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final canvas = context.canvas;

    final linePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const lineHeight = 20;
    const staffSpacing = 100;

    // Drawing the staff lines
    for (var y = 0.0; y < size.height; y += staffSpacing) {
      for (var i = 0.0; i < 5; i++) {
        canvas.drawLine(
          Offset(0, y + i * lineHeight),
          Offset(size.width, y + i * lineHeight),
          linePaint,
        );
      }
    }

    final notePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final random = Random();

    // Drawing random notes on the staff lines
    for (var y = 0.0; y < size.height; y += staffSpacing) {
      for (var x = 50.0; x < size.width; x += 50) {
        final noteY = y + (random.nextInt(5) * lineHeight);
        canvas.drawCircle(Offset(x, noteY), 5, notePaint);
      }
    }
  }
}
