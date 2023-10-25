import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DNATextureRenderObject extends RenderProxyBox {
  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);

    final canvas = context.canvas;
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.stroke;

    final dnaWidth = child!.size.width / 10;
    const numberOfSegments = 50;
    final segmentHeight = child!.size.height / numberOfSegments;

    for (var i = 0; i < numberOfSegments; i++) {
      final y = segmentHeight * i;
      final middle = child!.size.width / 2;
      final curveWidth = sin(pi * i / numberOfSegments) * dnaWidth;

      // Drawing DNA strands
      canvas
        ..drawLine(
          Offset(middle + curveWidth, y),
          Offset(middle - curveWidth, y + segmentHeight),
          paint,
        )
        ..drawLine(
          Offset(middle - curveWidth, y),
          Offset(middle + curveWidth, y + segmentHeight),
          paint,
        );

      // Drawing connecting rungs
      if (i % 5 == 0) {
        canvas.drawLine(
          Offset(middle + curveWidth, y),
          Offset(middle - curveWidth, y),
          paint,
        );
      }
    }
  }
}
